//
//  NetworkManager.m
//  Friendship-UP
//
//  Created by ed8009 on 26.08.16.
//  Copyright © 2016 ed8009. All rights reserved.
//

#import "NetworkManager.h"

@interface NetworkManager () <NSURLSessionDelegate, NSURLSessionTaskDelegate>

@property (strong, nonatomic) NSURLSession *friendUpSession;

@end

@implementation NetworkManager

+ (instancetype)sharedManager {
    static NetworkManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[NetworkManager alloc] init];
    });
    
    return sharedInstance;
}

- (id)init {
    if (self = [super init]) {
        // Session configuration
        NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
        sessionConfiguration.HTTPMaximumConnectionsPerHost = 3;
        self.friendUpSession = [NSURLSession sessionWithConfiguration:sessionConfiguration delegate:self delegateQueue:nil];
    }
    return self;
}

- (NSURLSessionDataTask *)performNetworkRequest:(RequestTask *)requestTask {
    NSURLSessionDataTask *sessionTask;
    if (requestTask.requestData) {
        if (requestTask.requestTaskType == RequestTaskTypeData) {
            sessionTask = [self.friendUpSession dataTaskWithRequest:[NetworkManager requestWithRequestData:requestTask.requestData]
                                                 completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                     [self handleResponseWithData:data response:response error:error requestTuple:requestTask];
                                                 }];
        }
//        else if (requestTask.requestTaskType == RequestTaskTypeUpload) {
//            sessionTask = [self.friendUpSession uploadTaskWithRequest:[NetworkManager uploadRequestWithRequestData:requestTask.requestData]
//                                                            fromData:[NetworkManager httpBodyWithImageData:requestTask.requestData.data]
//                                                   completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//                                                       [self handleResponseWithData:data response:response error:error requestTuple:requestTask];
//                                                   }];
   //     }
        
        [sessionTask resume];
    }
    
    return sessionTask;
}

- (void)handleResponseWithData:(NSData *)data response:(NSURLResponse *)response error:(NSError *)error requestTuple:(RequestTask *)requestTuple {
    NSInteger httpStatusCode = [(NSHTTPURLResponse *)response statusCode];
    if (error == nil && httpStatusCode == [kHTTPCodeSuccess integerValue]) {
        // Request was successed. No errors. We should parse and send data
        NSLog(@"Request successed: %@", response.URL);
        NSError *parseError;
        NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data
                                                                           options:NSJSONReadingAllowFragments
                                                                             error:&parseError];
        if (parseError) {
            NSLog(@"Unable to parse response. Details: %@.\n"
                       "Response: %@.\n"
                       "Data: %@.", parseError, response, data);
            error = parseError;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            requestTuple.completionBlock(error, responseDictionary);
        });
    }
    else {
        // Other errors
        if (error == nil) {
            // TODO: adapt errors description
            NSMutableDictionary *userInfo = [[NSJSONSerialization JSONObjectWithData:data
                                                                             options:NSJSONReadingAllowFragments
                                                                               error:nil] mutableCopy];
            [userInfo setObject:response.URL forKey:@"Response URL"];
            error = [NSError errorWithDomain:kFriendUpApiBaseUrl code:httpStatusCode userInfo:userInfo];
        }
        NSLog(@"Request failed. Error description: %@.", error);
        dispatch_async(dispatch_get_main_queue(), ^{
            requestTuple.completionBlock(error, nil);
        });
    }
}


+ (NSURLRequest *)requestWithRequestData:(NetworkRequestData *)requestData {
    NSMutableURLRequest *preparedRequest = [[NetworkManager baseRequestForRequestData:requestData] mutableCopy];
    if (requestData.data) {
        // Configure request body. If we have body then pasre it into the JSON
        NSError *jsonParseError = nil;
        preparedRequest.HTTPBody = [NSJSONSerialization dataWithJSONObject:requestData.data options:kNilOptions error:&jsonParseError];
        if (jsonParseError == nil) {
            [preparedRequest setValue:kHTTPHeaderContentValue forHTTPHeaderField:kHTTPHeaderContentType];
        } else {
            // If we will get an error then make this request uncreated
            preparedRequest = nil;
        }
    }
    
    return preparedRequest;
}

+ (NSURLRequest *)baseRequestForRequestData:(NetworkRequestData *)requestData {
    // Configure URL string with params
    NSString *serviceURL = [requestData.serviceURL stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSMutableString *stringUrl = [NSMutableString stringWithFormat:@"%@%@", kFriendUpApiBaseUrl, serviceURL];
    // Configure params
    NSMutableArray *parametersComponents = [[NSMutableArray alloc] init];

    for (NSString *paramKey in requestData.parameters) {
        NSString *paramString = [NSString stringWithFormat:@"%@=%@", paramKey, requestData.parameters[paramKey]];
        NSString *paramWithEncoding = [paramString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        [parametersComponents addObject:paramWithEncoding];
    }
    if (parametersComponents.count != 0) {
        [stringUrl appendFormat:@"?%@",[parametersComponents componentsJoinedByString:@"&"]];
    }
    
    NSMutableURLRequest *preparedRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:stringUrl]];
    [preparedRequest setHTTPMethod:requestData.httpMethod];
    
    return preparedRequest;
}
@end

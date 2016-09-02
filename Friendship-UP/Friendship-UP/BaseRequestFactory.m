//
//  BaseRequestFactory.m
//  Friendship-UP
//
//  Created by ed8009 on 26.08.16.
//  Copyright © 2016 ed8009. All rights reserved.
//

#import "BaseRequestFactory.h"

@implementation BaseRequestFactory

+ (NSURLSessionDataTask *)requestCreateUserWithVk:(NSString *)idVK token:(NSString *)token completon:(NetworkRequestCompletion)completion {
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSMutableDictionary *parameters = [@{kIdVkKey:idVK,kUserTokenKey:token,} mutableCopy];
    NSString *str = [NSString stringWithFormat:@"""%@"":%@,""%@"":%@",kIdVkKey, idVK,kUserTokenKey,token];
    NSString *urlApi = [NSString stringWithFormat:kCreateUser, str];
    urlApi = [urlApi stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:kDomen, urlApi]];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (error) {
            completion(error, nil);
        }
        else {
            completion(nil, responseObject);
        }
    }];
    [dataTask resume];
    
    return dataTask;
}

@end

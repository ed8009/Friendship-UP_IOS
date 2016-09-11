//
//  UserDataManager.m
//  Friendship-UP
//
//  Created by Distillery Mac on 05.09.16.
//  Copyright © 2016 ed8009. All rights reserved.
//

#import "UserDataManager.h"
#import "UsersRequestFactory.h"
#import "RequestsDispatcher.h"

@implementation UserDataManager

+ (instancetype)sharedInstance {
    static UserDataManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[UserDataManager alloc] init];
    });
    
    return sharedInstance;
}

- (RequestTask *)createUserWithId:(NSString *)idVK token:(NSString *)token completon:(void (^)(BOOL successed, NSError *error))completion {
    NetworkRequestData *loginRequest = [UsersRequestFactory createUserWithId:idVK token:token];
    NetworkRequestCompletion completionBlock = ^(NSError *error, NSDictionary *result) {
        NSDictionary *responseData = result[kResponseResultKey];
        if (!error && responseData) {
            if ([responseData[kResponseStatusCodeKey]  isEqual: kHTTPCodeExist]) {
                NSLog(@"user exist");
            }
            else if ([responseData[kResponseStatusCodeKey]  isEqual: kHTTPCodeSuccessCreating]) {
                NSLog(@"user created");
            }
            else {
                NSLog(@"%@", responseData[kResponseMessageKey]);
                if (completion) {
                    completion(NO, error);
                }
            }
            if (completion) {
                completion(YES, error);
            }
        }
        else if (completion) {
            completion(NO, error);
        }
    };
    return [RequestTask taskWithRequestData:loginRequest completionBlock:completionBlock];
}

- (void)getUserWithParameters:(NSDictionary *)param completon:(void (^)(NSDictionary *, BOOL, NSError *))completion {
    VKRequest * audioReq = [[VKApi users] get:param];
    [audioReq executeWithResultBlock:^(VKResponse * response) {
        if (completion) {
            completion(response.json[0], YES, nil);
        }
    } errorBlock:^(NSError * error) {
        if (error.code != VK_API_ERROR) {
            [error.vkError.request repeat];
        }
        else {
            NSLog(@"VK error: %@", error);
        }
        
        if (completion) {
            completion(nil, YES, nil);
        }
    }];
}

@end

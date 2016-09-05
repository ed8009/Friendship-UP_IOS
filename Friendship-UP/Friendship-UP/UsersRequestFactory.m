//
//  UsersRequestFactory.m
//  Friendship-UP
//
//  Created by Distillery Mac on 05.09.16.
//  Copyright © 2016 ed8009. All rights reserved.
//

#import "UsersRequestFactory.h"

@implementation UsersRequestFactory

+ (NetworkRequestData *)createUserWithId:(NSString *)idVK token:(NSString *)token {
    NSMutableDictionary *inputData = [@{kIdVkKey: idVK, kUserTokenKey:token} mutableCopy];
    NetworkRequestData *createUserRequest = [NetworkRequestData requestDataWithData:inputData
                                                                       dataType:RequestDataTypeDefault
                                                                     httpMethod:kHTTPMethodPOST
                                                                     serviceURL:kUsersLoginServiceURL
                                                                     parameters:nil
                                                                   isAuthorized:YES];
    return createUserRequest;
}

@end

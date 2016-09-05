//
//  CircleURLRequestData.m
//  Friendship-UP
//
//  Created by Distillery Mac on 05.09.16.
//  Copyright © 2016 ed8009. All rights reserved.
//

#import "FriendUpURLRequestData.h"

@implementation NetworkRequestData

+ (instancetype)requestDataWithData:(id)data
                           dataType:(RequestDataType)dataType
                         httpMethod:(NSString *)httpMethod
                         serviceURL:(NSString *)serviceURL
                         parameters:(NSDictionary *)parameters isAuthorized:(BOOL)isAuthorized {
    NetworkRequestData *requestData = [[NetworkRequestData alloc] init];
    requestData.data = data;
    requestData.httpMethod = httpMethod;
    requestData.serviceURL = serviceURL;
    requestData.parameters = parameters;
    requestData.authorized = isAuthorized;
    return requestData;
}

@end

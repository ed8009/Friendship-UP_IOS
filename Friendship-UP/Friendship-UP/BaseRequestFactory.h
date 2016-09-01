//
//  BaseRequestFactory.h
//  Friendship-UP
//
//  Created by ed8009 on 26.08.16.
//  Copyright © 2016 ed8009. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkManager.h"

@interface BaseRequestFactory : NSObject

+ (NSURLSessionDataTask *)requestCreateUserVkWith:(NSString *)idVK token:(NSString *)token completon:(NetworkRequestCompletion)completion;

@end

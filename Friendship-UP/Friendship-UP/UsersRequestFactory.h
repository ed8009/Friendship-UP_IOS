//
//  UsersRequestFactory.h
//  Friendship-UP
//
//  Created by Distillery Mac on 05.09.16.
//  Copyright © 2016 ed8009. All rights reserved.
//

#import "BaseRequestFactory.h"

@interface UsersRequestFactory : BaseRequestFactory

#pragma mark - Authorization
+ (NetworkRequestData *)createUserWithId:(NSString *)idVK token:(NSString *)token;

@end

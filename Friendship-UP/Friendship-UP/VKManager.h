//
//  VKManager.h
//  Friendship-UP
//
//  Created by Distillery Mac on 30.08.16.
//  Copyright © 2016 ed8009. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VKManager : NSObject

+ (void)authorizationVK;
+ (void)logoutVK;
+ (void)sessionVK;

@end

//
//  AIRVKSdkDelegate.h
//  Friendship-UP
//
//  Created by Distillery Mac on 30.08.16.
//  Copyright © 2016 ed8009. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VKSdk.h"

@protocol AIRVKSdkDelegate2 <NSObject>

- (void)vkSdkShouldPresentViewController2:(UIViewController *)controller;

@end

@interface AIRVKSdkDelegate : NSObject <VKSdkDelegate, VKSdkUIDelegate>

@property (weak, nonatomic) id<AIRVKSdkDelegate2> delegate;

+ (id) sharedInstance;
- (void)vkSdkAccessAuthorizationFinishedWithResult:(VKAuthorizationResult *)result;
- (void)vkSdkUserAuthorizationFailed;
- (void)vkSdkAuthorizationStateUpdatedWithResult:(VKAuthorizationResult *)result;
- (void)vkSdkAccessTokenUpdated:(VKAccessToken *)newToken oldToken:(VKAccessToken *)oldToken;
- (void)vkSdkTokenHasExpired:(VKAccessToken *)expiredToken;
- (void)vkSdkShouldPresentViewController:(UIViewController *)controller;
- (void)vkSdkNeedCaptchaEnter:(VKError *)captchaError;
- (void)vkSdkWillDismissViewController:(UIViewController *)controller;
- (void)vkSdkDidDismissViewController:(UIViewController *)controller;

@end

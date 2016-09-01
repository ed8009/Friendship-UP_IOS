//
//  AIRVKSdkDelegate.m
//  Friendship-UP
//
//  Created by Distillery Mac on 30.08.16.
//  Copyright © 2016 ed8009. All rights reserved.
//

#import "AIRVKSdkDelegate.h"
#import "OnboardingAnimatedTutorialViewController.h"

static AIRVKSdkDelegate* vkDelegateSharedInstance = nil;

@implementation AIRVKSdkDelegate

+ (id) sharedInstance {
    if( vkDelegateSharedInstance == nil ) {
        vkDelegateSharedInstance = [[AIRVKSdkDelegate alloc] init];
    }
    return vkDelegateSharedInstance;
}

- (void)vkSdkAccessAuthorizationFinishedWithResult:(VKAuthorizationResult *)result {
    NSLog(@"vkSdkAccessAuthorizationFinishedWithResult: %@. %lu",result, (unsigned long)result.state);
    if( result.error == nil ) {
        /* VKUser is not part of this result, it's available in 'vkSdkAuthorizationStateUpdatedWithResult' */
        //NSString* tokenJSON = [MPStringUtils getJSONString:[VKAccessTokenUtils toJSON:result.token]];
        NSLog(@"vkSdkAccessAuthorizationFinishedWithResult: %@", result);

    } else {
        // Even when cancelled
        NSLog(@"vkSdkAccessAuthorizationFinishedWithResult: %@", result.error.localizedDescription);
    }
}


- (void)vkSdkUserAuthorizationFailed {
    NSLog(@"vkSdkUserAuthorizationFailed");
}


- (void)vkSdkAuthorizationStateUpdatedWithResult:(VKAuthorizationResult *)result {
    NSLog(@"vkSdkAuthorizationStateUpdatedWithResult: %@", result.user);
}


- (void)vkSdkAccessTokenUpdated:(VKAccessToken *)newToken oldToken:(VKAccessToken *)oldToken {
    NSLog(@"vkSdkAccessTokenUpdated. newToken: %@", newToken.accessToken);
   // NSString* tokenJSON = [MPStringUtils getJSONString:[VKAccessTokenUtils toJSON:newToken]];
}


- (void)vkSdkTokenHasExpired:(VKAccessToken *)expiredToken {
    NSLog(@"vkSdkTokenHasExpired");
}


- (void)vkSdkShouldPresentViewController:(UIViewController *)controller {
    NSLog(@"vkSdkShouldPresentViewController");
    UIViewController *vkViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    [controller setModalPresentationStyle:UIModalPresentationOverFullScreen];
    [controller setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    [vkViewController presentViewController:controller animated:YES completion:nil];
}

- (void)vkSdkNeedCaptchaEnter:(VKError *)captchaError {
    NSLog(@"vkSdkNeedCaptchaEnter");
}


- (void)vkSdkWillDismissViewController:(UIViewController *)controller {
    NSLog(@"vkSdkWillDismissViewController");
}


- (void)vkSdkDidDismissViewController:(UIViewController *)controller {
    NSLog(@"vkSdkDidDismissViewController");
}
@end

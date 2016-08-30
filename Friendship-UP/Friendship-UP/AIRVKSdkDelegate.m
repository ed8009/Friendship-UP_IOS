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
    NSLog(@"result: %@. %lu",result, (unsigned long)result.state);
    if( result.error == nil ) {
        /* VKUser is not part of this result, it's available in 'vkSdkAuthorizationStateUpdatedWithResult' */
        //NSString* tokenJSON = [MPStringUtils getJSONString:[VKAccessTokenUtils toJSON:result.token]];
        NSLog(@"%@", result);

    } else {
        // Even when cancelled
        NSLog(@"%@", result.error.localizedDescription);
    }
}


- (void)vkSdkUserAuthorizationFailed {
    NSLog(@"vkSdkUserAuthorizationFailed");
}


- (void)vkSdkAuthorizationStateUpdatedWithResult:(VKAuthorizationResult *)result {
    NSLog(@"%@", result.user);
}


- (void)vkSdkAccessTokenUpdated:(VKAccessToken *)newToken oldToken:(VKAccessToken *)oldToken {
    NSLog(@"vkSdkAccessTokenUpdated. newToken: %@", newToken);
   // NSString* tokenJSON = [MPStringUtils getJSONString:[VKAccessTokenUtils toJSON:newToken]];
}


- (void)vkSdkTokenHasExpired:(VKAccessToken *)expiredToken {
    NSLog(@"vkSdkTokenHasExpired");
}


- (void)vkSdkShouldPresentViewController:(UIViewController *)controller {
    NSLog(@"vkSdkShouldPresentViewController");
    [[[[[UIApplication sharedApplication] delegate] window] rootViewController]presentViewController:controller animated:YES completion:nil];
   // [self.delegate vkSdkShouldPresentViewController2:controller];

//    OnboardingAnimatedTutorialViewController *taleNavigationController = [[OnboardingAnimatedTutorialViewController alloc] init];
//    [taleNavigationController presentViewController:controller animated:YES completion:nil];

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

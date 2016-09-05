//
//  OnboardingAnimatedTutorialViewController.m
//  Friendship-UP
//
//  Created by ed8009 on 26.08.16.
//  Copyright © 2016 ed8009. All rights reserved.
//

#import "OnboardingAnimatedTutorialViewController.h"
#import "VkFriendsViewController.h"
#import "UIViewController+FriendUP.h"
#import "UserDataManager.h"
#import "RequestsDispatcher.h"
#import <MBProgressHUD/MBProgressHUD.h>

@interface OnboardingAnimatedTutorialViewController () <VKSdkDelegate, VKSdkUIDelegate>

@end

@implementation OnboardingAnimatedTutorialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    VKSdk* sdkInstance = [VKSdk initializeWithAppId:@"5606535"];
    [sdkInstance registerDelegate:self];
    [sdkInstance setUiDelegate:self];
    
    NSArray *SCOPE = @[@"friends", @"email"];

    [VKSdk wakeUpSession:SCOPE completeBlock:^(VKAuthorizationState state, NSError *error) {
        if (state == VKAuthorizationAuthorized) {
            NSLog(@"VKAuthorizationAuthorized");
            [self presentFriendViewController];
        }
        else if (state == VKAuthorizationInitialized) {
            NSLog(@"VKAuthorizationInitialized");
        }
        else if (state == VKAuthorizationError || error) {
            NSLog(@"%@", error);
        }
    }];
}

- (IBAction)authorization:(id)sender {
    NSArray *SCOPE = @[@"friends", @"email"];
    [VKSdk authorize:SCOPE ];
}

- (void)presentFriendViewController {
    VkFriendsViewController *friendsController = (VkFriendsViewController *)[UIViewController circlesFriends];
    [friendsController setModalPresentationStyle:UIModalPresentationFullScreen];
    [friendsController setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    [self presentViewController:friendsController animated:YES completion:nil];
}

#pragma mark delegate vk

- (void)vkSdkAccessAuthorizationFinishedWithResult:(VKAuthorizationResult *)result {
    if(!result.error) {
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        RequestTask *loginRequest = [[UserDataManager sharedInstance] createUserWithId:result.token.userId token:result.token.accessToken completon:^(BOOL successed, NSError *error) {
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            if (successed) {
                [self presentFriendViewController];
            }
            else {
                NSLog(@"%@", error);
            }
        }];
        [RequestsDispatcher performSingleRequest:loginRequest];
        
    } else {
        NSLog(@"vkSdkAccessAuthorizationFinishedWithResult: %@", result.error.localizedDescription);
    }
}

- (void)vkSdkUserAuthorizationFailed {
    NSLog(@"vkSdkUserAuthorizationFailed");
}

- (void)vkSdkShouldPresentViewController:(UIViewController *)controller {
    [controller setModalPresentationStyle:UIModalPresentationOverFullScreen];
    [controller setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    [self presentViewController:controller animated:YES completion:nil];
}

- (void)vkSdkNeedCaptchaEnter:(VKError *)captchaError {
    NSLog(@"vkSdkNeedCaptchaEnter");
}

@end

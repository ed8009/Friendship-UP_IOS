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

@property (strong, nonatomic) NSArray *scope;

@end

@implementation OnboardingAnimatedTutorialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scope = @[@"friends", @"photos", @"status", @"wall"];
    
    VKSdk* sdkInstance = [VKSdk initializeWithAppId:@"5606535"];
    [sdkInstance registerDelegate:self];
    [sdkInstance setUiDelegate:self];
    
    [VKSdk wakeUpSession:self.scope completeBlock:^(VKAuthorizationState state, NSError *error) {
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
    [VKSdk authorize:self.scope ];
}

- (void)presentFriendViewController {
    VkFriendsViewController *friendsController = (VkFriendsViewController *)[UIViewController circlesFriends];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:friendsController];
    [navController setModalPresentationStyle:UIModalPresentationFullScreen];
    [navController setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    [self presentViewController:navController animated:YES completion:nil];
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

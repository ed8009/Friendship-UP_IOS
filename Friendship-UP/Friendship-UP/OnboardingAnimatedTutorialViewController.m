//
//  OnboardingAnimatedTutorialViewController.m
//  Friendship-UP
//
//  Created by ed8009 on 26.08.16.
//  Copyright © 2016 ed8009. All rights reserved.
//

#import "OnboardingAnimatedTutorialViewController.h"
#import <VKSdk.h>
#import "VKManager.h"
#import "AIRVKSdkDelegate.h"
#import "VkFriendsViewController.h"
#import "UIViewController+FriendUP.h"

@interface OnboardingAnimatedTutorialViewController ()

@end

@implementation OnboardingAnimatedTutorialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [VKManager sessionVK:^(RequestTaskType type, NSError *error) {
        if (!error) {
            if (type == VKRequestAuthorized) {
                NSLog(@"VKAuthorizationAuthorized");
                UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Friends" bundle:nil];
                VkFriendsViewController *friendsController =[storyboard instantiateViewControllerWithIdentifier:@"VkFriendsViewController"];
                [friendsController setModalPresentationStyle:UIModalPresentationFullScreen];
                [friendsController setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
                [self presentViewController:friendsController animated:YES completion:nil];
            }
            else if (type == VKRequestInitialized) {
                NSLog(@"VKAuthorizationInitialized");
            }
        }
        else {
            NSLog(@"%@", error);
        }
    }];
}

- (IBAction)authorization:(id)sender {
    [VKManager authorizationVK];
    
}

- (IBAction)logout:(id)sender {
    [VKManager logoutVK];
    
}



@end

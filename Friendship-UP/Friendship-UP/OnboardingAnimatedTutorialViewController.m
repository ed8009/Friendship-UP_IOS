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



@interface OnboardingAnimatedTutorialViewController () <AIRVKSdkDelegate2>

@end

@implementation OnboardingAnimatedTutorialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [VKManager sessionVK];
}

- (void)vkSdkShouldPresentViewController2:(UIViewController *)controller {
    //[self presentViewController:controller animated:YES completion:nil];
     [[[[[UIApplication sharedApplication] delegate] window] rootViewController]presentViewController:controller animated:YES completion:nil];

}

- (IBAction)authorization:(id)sender {
    [VKManager authorizationVK];
    
}

- (IBAction)logout:(id)sender {
    [VKManager logoutVK];
    
}



@end

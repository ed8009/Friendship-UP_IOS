//
//  UIViewController+FriendUP.m
//  Friendship-UP
//
//  Created by ed8009 on 01.09.16.
//  Copyright © 2016 ed8009. All rights reserved.
//

#import "UIViewController+FriendUP.h"
#import "UIStoryboard+FriendUP.h"

static NSString * const ViewControllerNameOnboardingAnimatedTutorialViewController = @"OnboardingAnimatedTutorialViewController";
static NSString * const ViewControllerVKFriendsViewController = @"VKFriendsViewController";

@implementation UIViewController (FriendUP)

+ (UIViewController *)circlesOnboardingAnimatedTutorialViewController {
    return [[UIStoryboard circlesOnboardingStoryboard] instantiateViewControllerWithIdentifier:ViewControllerNameOnboardingAnimatedTutorialViewController];
}

+ (UIViewController *)circlesFriends {
     return [[UIStoryboard circlesFriendsStoryboard] instantiateViewControllerWithIdentifier:ViewControllerVKFriendsViewController];
}
@end

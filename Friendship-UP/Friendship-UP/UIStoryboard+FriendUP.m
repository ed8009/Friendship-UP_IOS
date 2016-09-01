//
//  UIStoryboard+FriendUP.m
//  Friendship-UP
//
//  Created by ed8009 on 01.09.16.
//  Copyright © 2016 ed8009. All rights reserved.
//

#import "UIStoryboard+FriendUP.h"

static NSString * const StoryboardNameOnboarding = @"Onboarding";
static NSString * const StoryboardNameFriends = @"Friends";

@implementation UIStoryboard (FriendUP)

+ (UIStoryboard *)circlesOnboardingStoryboard {
    return [UIStoryboard storyboardWithName:StoryboardNameOnboarding bundle:nil];
}

+ (UIStoryboard *)circlesFriendsStoryboard {
    return [UIStoryboard storyboardWithName:StoryboardNameFriends bundle:nil];
}
@end

//
//  VKManager.m
//  Friendship-UP
//
//  Created by Distillery Mac on 30.08.16.
//  Copyright © 2016 ed8009. All rights reserved.
//

#import "VKManager.h"
#import "AIRVKSdkDelegate.h"
#import <VKSdk.h>

@implementation VKManager

+ (void)sessionVK:(void (^)(RequestTaskType type, NSError *error))completion {

    NSArray *SCOPE = @[@"friends", @"email"];
    
    VKSdk* sdkInstance = [VKSdk initializeWithAppId:@"5606535"];
    [sdkInstance registerDelegate:[AIRVKSdkDelegate sharedInstance]];
    [sdkInstance setUiDelegate:[AIRVKSdkDelegate sharedInstance]];
    
    [VKSdk wakeUpSession:SCOPE completeBlock:^(VKAuthorizationState state, NSError *error) {
        RequestTaskType type = VKRequestError;
        if (state == VKAuthorizationAuthorized) {
            type = VKRequestAuthorized;
        }
        else if (state == VKAuthorizationInitialized) {
            type = VKRequestInitialized;
        }
        else if (state == VKAuthorizationError || error) {
            type = VKRequestError;
        }
        
        if (completion) {
            completion(type, error);
        }
    }];
}

+ (void)authorizationVK {
    NSArray *SCOPE = @[@"friends", @"email"];
    [VKSdk authorize:SCOPE ];
    
}

+ (void)logoutVK {
    [VKSdk forceLogout];
}
@end

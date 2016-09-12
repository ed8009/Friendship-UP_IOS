//
//  FriendDataManager.m
//  Friendship-UP
//
//  Created by Distillery Mac on 06.09.16.
//  Copyright © 2016 ed8009. All rights reserved.
//

#import "FriendDataManager.h"
#import "RequestsDispatcher.h"

static NSString *const kParamFields   = @"fields";
static NSString *const kParam   = @"photo_max_orig, common_count";

@implementation FriendDataManager

+ (instancetype)sharedInstance {
    static FriendDataManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[FriendDataManager alloc] init];
    });
    return sharedInstance;
}

- (void)getUserFriends:(void (^)(NSDictionary *,  BOOL, NSError *))completion {
    NSDictionary *param = @{kParamFields:kParam};
    VKRequest * audioReq = [[VKApi friends] get:param];
    
    [audioReq executeWithResultBlock:^(VKResponse * response) {
        if (completion) {
            completion(response.json, YES, nil);
        }
    } errorBlock:^(NSError * error) {
        if (error.code != VK_API_ERROR) {
            [error.vkError.request repeat];
        }
        else {
            NSLog(@"VK error: %@", error);
        }
        if (completion) {
            completion(nil, NO, nil);
        }
    }];
}

@end

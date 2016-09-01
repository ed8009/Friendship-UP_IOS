//
//  VKManager.h
//  Friendship-UP
//
//  Created by Distillery Mac on 30.08.16.
//  Copyright © 2016 ed8009. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, RequestTaskType) {
    VKRequestAuthorized,
    VKRequestInitialized,
    VKRequestError
};

typedef void(^VkSessionCompletion)(BOOL);

@interface VKManager : NSObject

@property (strong, nonatomic) VkSessionCompletion completionBlock;

+ (void)authorizationVK;
+ (void)logoutVK;
+ (void)sessionVK:(void (^)(RequestTaskType type, NSError *error))completion;

@end

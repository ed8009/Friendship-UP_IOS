//
//  BaseDataManager.m
//  Friendship-UP
//
//  Created by Distillery Mac on 05.09.16.
//  Copyright © 2016 ed8009. All rights reserved.
//

#import "BaseDataManager.h"

@implementation BaseDataManager

+ (instancetype)sharedInstance {
    static BaseDataManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[BaseDataManager alloc] init];
    });
    
    return sharedInstance;
}

#pragma mark - Helpers

- (BOOL)checkForNull:(id)object {
    return [object isKindOfClass:[NSNull class]];
}

@end

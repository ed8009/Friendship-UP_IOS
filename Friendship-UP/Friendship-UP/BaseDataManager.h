//
//  BaseDataManager.h
//  Friendship-UP
//
//  Created by Distillery Mac on 05.09.16.
//  Copyright © 2016 ed8009. All rights reserved.
//

#import "NetworkManager.h"

@interface BaseDataManager : NSObject

+ (instancetype)sharedInstance;
- (BOOL)checkForNull:(id)object;

@end

//
//  UserDataManager.h
//  Friendship-UP
//
//  Created by Distillery Mac on 05.09.16.
//  Copyright © 2016 ed8009. All rights reserved.
//

#import "BaseDataManager.h"

@interface UserDataManager : BaseDataManager

#pragma mark - Authorization

- (RequestTask *)createUserWithId:(NSString *)idVK token:(NSString *)token completon:(void (^)(BOOL successed, NSError *error))completion;

@end

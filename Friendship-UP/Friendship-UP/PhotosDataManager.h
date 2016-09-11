//
//  PhotosDataManager.h
//  Friendship-UP
//
//  Created by Distillery Mac on 06.09.16.
//  Copyright © 2016 ed8009. All rights reserved.
//

#import "BaseDataManager.h"

@interface PhotosDataManager : BaseDataManager

- (void)getUserPhotoWithId:(NSInteger)idPhoto completon:(void (^)(NSDictionary *result, BOOL successed, NSError *error))completion;

@end

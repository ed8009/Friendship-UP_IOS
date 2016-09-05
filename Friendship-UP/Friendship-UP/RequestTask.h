//
//  RequestTask.h
//  Friendship-UP
//
//  Created by Distillery Mac on 05.09.16.
//  Copyright © 2016 ed8009. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FriendUpURLRequestData.h"

typedef NS_ENUM(NSInteger, RequestTaskType) {
    RequestTaskTypeUpload,
    RequestTaskTypeData
};

typedef void (^NetworkRequestCompletion)(NSError *error, id result);

@interface RequestTask : NSObject

@property (strong, nonatomic) NetworkRequestData *requestData;
@property (strong, nonatomic) NetworkRequestCompletion completionBlock;
@property (assign, nonatomic) RequestTaskType requestTaskType;
@property (assign, nonatomic) BOOL isRequired;

+ (RequestTask *)taskWithRequestData:(NetworkRequestData *)requestData completionBlock:(NetworkRequestCompletion)completion;

@end

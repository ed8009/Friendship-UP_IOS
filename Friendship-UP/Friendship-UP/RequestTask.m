//
//  RequestTask.m
//  Friendship-UP
//
//  Created by Distillery Mac on 05.09.16.
//  Copyright © 2016 ed8009. All rights reserved.
//

#import "RequestTask.h"

@implementation RequestTask

- (id)init {
    if (self = [super init]) {

    }
    return self;
}

+ (RequestTask *)taskWithRequestData:(NetworkRequestData *)requestData completionBlock:(NetworkRequestCompletion)completion {
    RequestTask *task = [[RequestTask alloc] init];
    task.requestData = requestData;
    task.completionBlock = completion;
    task.requestTaskType = RequestTaskTypeData;
    task.isRequired = NO;
    return task;
}


@end

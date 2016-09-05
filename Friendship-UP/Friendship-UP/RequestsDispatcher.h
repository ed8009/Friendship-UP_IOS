//
//  RequestsDispatcher.h
//  Friendship-UP
//
//  Created by Distillery Mac on 05.09.16.
//  Copyright © 2016 ed8009. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RequestTask.h"

@interface RequestsDispatcher : NSObject

+ (void)performSingleRequest:(RequestTask *)requestTuple;

@end

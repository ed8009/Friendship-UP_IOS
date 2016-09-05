//
//  RequestsDispatcher.m
//  Friendship-UP
//
//  Created by Distillery Mac on 05.09.16.
//  Copyright © 2016 ed8009. All rights reserved.
//

#import "RequestsDispatcher.h"
#import "NetworkManager.h"

@implementation RequestsDispatcher

+ (void)performSingleRequest:(RequestTask *)requestTuple {
    [[NetworkManager sharedManager] performNetworkRequest:requestTuple];
}

@end

//
//  NetworkManager.h
//  Friendship-UP
//
//  Created by ed8009 on 26.08.16.
//  Copyright © 2016 ed8009. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkConstants.h"
#import "AFNetworking.h"

@interface NetworkManager : NSObject

typedef void (^NetworkRequestCompletion)(NSError *error, id result);

@end

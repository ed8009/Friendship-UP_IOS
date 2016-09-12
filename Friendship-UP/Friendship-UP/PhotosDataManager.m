//
//  PhotosDataManager.m
//  Friendship-UP
//
//  Created by Distillery Mac on 06.09.16.
//  Copyright © 2016 ed8009. All rights reserved.
//

#import "PhotosDataManager.h"
#import "RequestsDispatcher.h"

@implementation PhotosDataManager

+ (instancetype)sharedInstance {
    static PhotosDataManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[PhotosDataManager alloc] init];
    });
    return sharedInstance;
}

- (void)getUserPhotoWithId:(NSInteger)idPhoto completon:(void (^)(NSDictionary *, BOOL, NSError *))completion {
    VKRequest * audioReq = [[VKApi photos] getUploadServer:idPhoto];
    [audioReq executeWithResultBlock:^(VKResponse * response) {
        if (completion) {
            completion(response.json[0], YES, nil);
        }
    } errorBlock:^(NSError * error) {
        if (error.code != VK_API_ERROR) {
            [error.vkError.request repeat];
        }
        else {
            NSLog(@"VK error: %@", error);
        }
        
        if (completion) {
            completion(nil, YES, nil);
        }
    }];
}

@end

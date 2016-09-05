//
//  CircleURLRequestData.h
//  Friendship-UP
//
//  Created by Distillery Mac on 05.09.16.
//  Copyright © 2016 ed8009. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, RequestDataType) {
    RequestDataTypeImage,
    RequestDataTypeDocument,
    RequestDataTypeVideo,
    RequestDataTypeJSON,
    RequestDataTypeDefault
};

@interface NetworkRequestData : NSObject

@property (assign, nonatomic, setter=isAuthorized:) BOOL authorized;
@property (strong, nonatomic) NSString *httpMethod;
@property (strong, nonatomic) NSString *serviceURL;
@property (strong, nonatomic) NSDictionary *parameters;
@property (strong, nonatomic) NSData *data;
@property (assign, nonatomic) RequestDataType *dataType;

+ (instancetype)requestDataWithData:(id)data
                           dataType:(RequestDataType)dataType
                         httpMethod:(NSString *)httpMethod
                         serviceURL:(NSString *)serviceURL
                         parameters:(NSDictionary *)parameters
                       isAuthorized:(BOOL)isAuthorized;

@end

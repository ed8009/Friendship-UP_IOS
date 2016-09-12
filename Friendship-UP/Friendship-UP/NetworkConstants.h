//
//  NetworkConstants.h
//  Friendship-UP
//
//  Created by ed8009 on 26.08.16.
//  Copyright © 2016 ed8009. All rights reserved.
//

#ifndef NetworkConstants_h
#define NetworkConstants_h

#pragma mark - HTTP Methods
static NSString *const kHTTPMethodPOST   = @"POST";
static NSString *const kHTTPMethodGET    = @"GET";
static NSString *const kHTTPMethodPUT    = @"PUT";
static NSString *const kHTTPMethodDELETE = @"DELETE";

#pragma mark - Services URLs
//static NSString *const kPrefineryBaseURL = @"http://travel-app.ru/api";

#pragma mark - Response server keys
static NSString *const kHTTPCodeSuccess = @"200";
static NSString *const kHTTPCodeSuccessCreating = @"201";
static NSString *const kHTTPCodeAccepted = @"202";
static NSString *const kHTTPCodeUnauthorized = @"401";
static NSString *const kHTTPCodeNotFound = @"404";
static NSString *const kHTTPCodeExist = @"302";
static NSString *const kResponseResultKey = @"result";
static NSString *const kResponseMessageKey = @"message";
static NSString *const kResponseStatusCodeKey = @"status code";

#pragma mark - headers
static NSString *const kHTTPHeaderContentType  = @"Content-Type";
static NSString *const kHTTPHeaderContentValue = @"application/json; charset=utf-8";

#pragma mark - Backend constants
static NSString *const kFriendUpApiBaseUrl = @"http://travel-app.ru/api";

/// User
static NSString *const kUsersServiceURL = @"/users";
static NSString *const kUsersLoginServiceURL = @"/users/addUser";
static NSString *const kUsersLogoutServiceURL = @"/users/logout";
static NSString *const kUsersIdServiceURL = @"/users/%@";

#pragma mark key
static NSString *const kIdVkKey = @"idVK";
static NSString *const kUserTokenKey = @"token";

#endif /* NetworkConstants_h */

//
//  AFAppDotNetAPIClient.m
//  CourseraOnline
//
//  Created by LinShan Jiang on 23/12/15.
//  Copyright © 2015年 LinShan Jiang. All rights reserved.
//

#import "AFAppDotNetAPIClient.h"

static NSString* const CourseBaseUrlString = @"https://api.coursera.org/api/courses.v1";

@implementation AFAppDotNetAPIClient

+ (instancetype)sharedClient {
    static AFAppDotNetAPIClient *_sharedClient = nil;
    //create singleton
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[AFAppDotNetAPIClient alloc] initWithBaseURL:[NSURL URLWithString:CourseBaseUrlString]];
        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    });
    
    return _sharedClient;
}

@end

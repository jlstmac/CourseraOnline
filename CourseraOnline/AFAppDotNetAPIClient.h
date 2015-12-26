//
//  AFAppDotNetAPIClient.h
//  CourseraOnline
//
//  Created by LinShan Jiang on 23/12/15.
//  Copyright © 2015年 LinShan Jiang. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface AFAppDotNetAPIClient : AFHTTPSessionManager
+ (instancetype)sharedClient;
@end

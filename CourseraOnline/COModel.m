//
//  COModel.m
//  CourseraOnline
//
//  Created by LinShan Jiang on 23/12/15.
//  Copyright © 2015年 LinShan Jiang. All rights reserved.
//

#import "COModel.h"
#import "AFAppDotNetAPIClient.h"
#import "COBasicInfo.h"

@implementation COModel
+ (NSURLSessionDataTask *)globalTimelinePostsWithBlock:(void (^)(NSArray *posts, NSError *error))block {
    return [[AFAppDotNetAPIClient sharedClient] GET:@"?fields=photoUrl" parameters:nil progress:nil success:^(NSURLSessionDataTask * __unused task, id JSON) {
        NSArray *postsFromResponse = [JSON valueForKeyPath:@"elements"];
        NSMutableArray *mutablePosts = [NSMutableArray arrayWithCapacity:[postsFromResponse count]];
        for (NSDictionary *attributes in postsFromResponse) {
            COBasicInfo* info = [[COBasicInfo alloc] initWithDictionary:attributes];
            [mutablePosts addObject:info];
        }
        
        if (block) {
            block([NSArray arrayWithArray:mutablePosts], nil);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block([NSArray array], error);
        }
    }];
}

@end

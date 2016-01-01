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
#import "COFavorites.h"

@implementation COModel
+ (NSURLSessionDataTask *)globalTimelinePostsWithBlock:(void (^)(NSArray *posts, NSError *error))block {
    return [[AFAppDotNetAPIClient sharedClient] GET:@"?fields=photoUrl,workload,description,previewLink,primaryLanguages,categories" parameters:nil progress:nil success:^(NSURLSessionDataTask * __unused task, id JSON) {
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

+ (NSURLSessionDataTask*)getCoursesById:(NSString *)courseId Block:(void (^)(NSDictionary *posts, NSError *error))block{
    NSString* url = [NSString stringWithFormat:@"%@?includes=partnerIds,instructorIds&fields=instructors.v1(fullName,photo)",courseId];
    return [[AFAppDotNetAPIClient sharedClient] GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask* __unused task,id JSON){
        NSDictionary* postsFromRespnose = [JSON valueForKeyPath:@"linked"];

        if (block) {
            block(postsFromRespnose,nil);
        }
        
    } failure:^(NSURLSessionDataTask* __unused task, NSError* error){
        if (block) {
            block([NSDictionary dictionary],error);
        }
    }
            ];
}

@end

//
//  COModel.h
//  CourseraOnline
//
//  Created by LinShan Jiang on 23/12/15.
//  Copyright © 2015年 LinShan Jiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface COModel : NSObject


@property(nonatomic,strong,readwrite) NSArray* BasicInfoArray;
+ (NSURLSessionDataTask *)globalTimelinePostsWithBlock:(void (^)(NSArray *posts, NSError *error))block;

+ (NSURLSessionDataTask *)getCoursesById:(NSString*)courseId Block:(void (^)(NSDictionary* posts, NSError* error))block;

@end

//
//  COCourses.h
//  CourseraOnline
//
//  Created by LinShan Jiang on 24/12/15.
//  Copyright © 2015年 LinShan Jiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "COBasicInfo.h"

@interface COCourses : NSObject

@property(nonatomic,strong,nullable) COBasicInfo* BasicInfo;
@property(nonatomic,strong,nullable) NSArray* Instructors;
@property(nonatomic,strong,nullable) NSArray* Partners;


-(nullable instancetype)initWithDictionary:(nonnull NSDictionary*)dict BasicInfo:(nonnull COBasicInfo*)basic;
-(nullable instancetype)initWithBasicInfo:(nonnull COBasicInfo*)basic;

@end

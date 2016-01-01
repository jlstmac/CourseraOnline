//
//  COCourses.m
//  CourseraOnline
//
//  Created by LinShan Jiang on 24/12/15.
//  Copyright © 2015年 LinShan Jiang. All rights reserved.
//

#import "COCourses.h"

@implementation COCourses

-(instancetype)initWithDictionary:(NSDictionary *)dict BasicInfo:(COBasicInfo*)basic{
    self = [super init];
    if (self && dict) {
        self.BasicInfo = basic;
        self.Instructors = [dict valueForKey:@"instructors"];
        self.Partners = [dict valueForKey:@"partners"];

    }
    return self;
}

-(instancetype)initWithBasicInfo:(COBasicInfo *)basic{
    self = [super init];
    if (self && basic) {
        self.BasicInfo = basic;
        self.Instructors = nil;
        self.Partners = nil;
        
    }
    return self;
}

@end

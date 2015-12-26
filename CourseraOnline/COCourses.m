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
        self.Categories = [dict valueForKey:@"categories"];
        self.WorkLoad = [dict valueForKey:@"workload"];
        self.Description = [dict valueForKey:@"description"];
        self.PreviewLink = [dict valueForKey:@"previewLink"];
        self.InstructorIds = [dict valueForKey:@"instructorIds"];
        self.PartnerIds = [dict valueForKey:@"partnerIds"];
        self.Instructors = [dict valueForKey:@"instructors"];
        self.Partners = [dict valueForKey:@"partners"];
        self.PrimaryLanguages = [dict valueForKey:@"primaryLanguages"];


    }
    return self;
}

@end

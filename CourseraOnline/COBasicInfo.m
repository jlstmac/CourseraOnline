//
//  COBasicInfo.m
//  CourseraOnline
//
//  Created by LinShan Jiang on 24/12/15.
//  Copyright © 2015年 LinShan Jiang. All rights reserved.
//

#import "COBasicInfo.h"

@implementation COBasicInfo
-(instancetype)initWithDictionary:(NSDictionary *)dict{
    self = [super init];
    if (self && dict) {
        self.Id = [dict valueForKey:@"id"];
        self.Name = [dict valueForKey:@"name"];
        self.Slug = [dict valueForKey:@"slug"];
        self.CourseType = [dict valueForKey:@"courseType"];
        self.PhotoUrl =[NSURL URLWithString:[dict valueForKey:@"photoUrl"]];

    }
    return self;
}

@end

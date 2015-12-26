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
@property(nonatomic,strong,nullable) NSString* WorkLoad;
@property(nonatomic,strong,nullable) NSString* Description;
@property(nonatomic,strong,nullable) NSString* PreviewLink;  //option
@property(nonatomic,strong,nullable) NSArray* InstructorIds;
@property(nonatomic,strong,nullable) NSArray* PartnerIds;
@property(nonatomic,strong,nullable) NSArray* Instructors;
@property(nonatomic,strong,nullable) NSArray* Partners;
@property(nonatomic,strong,nullable) NSArray* PrimaryLanguages;
@property(nonatomic,strong,nullable) NSArray* Categories;

-(nullable instancetype)initWithDictionary:(nonnull NSDictionary*)dict BasicInfo:(nonnull COBasicInfo*)basic;

@end

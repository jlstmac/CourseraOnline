//
//  COBasicInfo.h
//  CourseraOnline
//
//  Created by LinShan Jiang on 24/12/15.
//  Copyright © 2015年 LinShan Jiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface COBasicInfo : NSObject

@property(nonatomic,strong) NSString* Id;
@property(nonatomic,strong) NSString* Name;
@property(nonatomic,strong) NSString* Slug;
@property(nonatomic,strong) NSString* CourseType;
@property(nonatomic,strong,nullable) NSURL* PhotoUrl;     //option
-(instancetype)initWithDictionary:(NSDictionary*)dict;

@end

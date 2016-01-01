//
//  COFavorites.h
//  CourseraOnline
//
//  Created by LinShan Jiang on 27/12/15.
//  Copyright © 2015年 LinShan Jiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class COBasicInfo;
@interface COFavorites : NSObject<NSCoding>

@property(nonatomic,readonly,strong) NSMutableSet* myFavorites;

+(instancetype)sharedInstance;

-(void)insertOneCourse:(COBasicInfo*)course;
-(void)removeOneCourse:(COBasicInfo*)course;
-(BOOL)isCourseFavorite:(COBasicInfo*)course;
-(void)save;
+(COFavorites*)loadData;
@end

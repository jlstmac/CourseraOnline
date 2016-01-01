//
//  COFavorites.m
//  CourseraOnline
//
//  Created by LinShan Jiang on 27/12/15.
//  Copyright © 2015年 LinShan Jiang. All rights reserved.
//

#import "COFavorites.h"
#import "COModel.h"
#import "COBasicInfo.h"

@implementation COFavorites

-(instancetype)init{
    self = [super init];
    if (self) {
        _myFavorites = [[NSMutableSet alloc] initWithCapacity:0];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.myFavorites forKey:@"Favorites"];
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        _myFavorites = [aDecoder decodeObjectForKey:@"Favorites"];
    }
    return self;
}

-(void)insertOneCourse:(COBasicInfo *)course{
    if (course && ![self.myFavorites containsObject:course]) {
        [self.myFavorites addObject:course];
        [self save];
    }
}

-(void)removeOneCourse:(COBasicInfo *)course{
    if (course && [self.myFavorites count]) {
        for(id obj in self.myFavorites){
            COBasicInfo* info = obj;
            if ([info.Id isEqualToString:course.Id]) {
                [self.myFavorites removeObject:obj];
                break;
            }
        }
        [self save];
    }
}

-(BOOL)isCourseFavorite:(COBasicInfo *)course{
    BOOL pRet = NO;
    if (course && [self.myFavorites count]) {
        for(id obj in self.myFavorites){
            COBasicInfo* info = obj;
            if ([info.Id isEqualToString:course.Id]) {
                pRet = YES;
                break;
            }
        }
    }
    return pRet;
}

-(void)save{
    NSString* docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES) lastObject];
    NSString* docName = [docPath stringByAppendingString:@"Favorites.data"];
    [NSKeyedArchiver archiveRootObject:self toFile:docName];
}

+(COFavorites*)loadData{
    NSString* docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES) lastObject];
    NSString* docName = [docPath stringByAppendingString:@"Favorites.data"];
    COFavorites* cf = (COFavorites*)[NSKeyedUnarchiver unarchiveObjectWithFile:docName];
    return cf;
}

+(instancetype)sharedInstance{
    static COFavorites* pRet = nil;
    
    if (pRet) {
        return pRet;
    }
    
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        pRet = [COFavorites loadData];
        if (!pRet) {
            pRet = [[COFavorites alloc] init];
        }
    });
    

    return pRet;
}
@end

//
//  COCoursesViewController.h
//  CourseraOnline
//
//  Created by LinShan Jiang on 29/12/15.
//  Copyright © 2015年 LinShan Jiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class COCourses;
@interface COCoursesViewController : UITableViewController<UITextViewDelegate>
@property(nonatomic,strong) COCourses* course;
@property(nonatomic,strong) NSArray* sourceArr;
@property(nonatomic,assign) CGRect cellViewFrame;

- (UIView*)makeCellByIndexPath:(NSIndexPath*)indexPatch;
- (void)switchAction:(id)sender;
@end

//
//  COCourseViewController.h
//  CourseraOnline
//
//  Created by LinShan Jiang on 24/12/15.
//  Copyright © 2015年 LinShan Jiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface COCourseViewController : UIViewController<UIScrollViewDelegate>

@property(nonatomic,weak) IBOutlet UITextView* descriptionView;
@property(nonatomic,weak) IBOutlet UIScrollView* scrollView;

@end

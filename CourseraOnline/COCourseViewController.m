//
//  COCourseViewController.m
//  CourseraOnline
//
//  Created by LinShan Jiang on 24/12/15.
//  Copyright © 2015年 LinShan Jiang. All rights reserved.
//

#import "COCourseViewController.h"

@interface COCourseViewController ()

@end

@implementation COCourseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollView.delegate = self;
    CGSize winsize = [UIScreen mainScreen].bounds.size;
    self.scrollView.contentSize = CGSizeMake(winsize.width, winsize.height*2);
    CGSize textSize = self.descriptionView.contentSize;
    NSLog(@"w:%f,h:%f",textSize.width,textSize.height);
    self.descriptionView.contentSize = CGSizeMake(winsize.width, textSize.height);
    textSize = self.descriptionView.contentSize;
    NSLog(@"w:%f,h:%f",textSize.width,textSize.height);
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

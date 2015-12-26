//
//  COFavoritesViewController.m
//  CourseraOnline
//
//  Created by LinShan Jiang on 23/12/15.
//  Copyright © 2015年 LinShan Jiang. All rights reserved.
//

#import "COFavoritesViewController.h"

@interface COFavoritesViewController ()

@end

@implementation COFavoritesViewController

//overwrite init
-(instancetype)init{
    self = [super init];
    if (self) {
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Favorites" image:nil tag:1];
        self.title = @"Favorites";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

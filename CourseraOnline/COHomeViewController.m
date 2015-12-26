//
//  COHomeViewController.m
//  CourseraOnline
//
//  Created by LinShan Jiang on 23/12/15.
//  Copyright © 2015年 LinShan Jiang. All rights reserved.
//

#import "COHomeViewController.h"
#import <Foundation/Foundation.h>
#import "UIRefreshControl+AFNetworking.h"
#import "COModel.h"
#import "COTableViewCell.h"
#import "COCourseViewController.h"

@interface COHomeViewController ()

@end

@implementation COHomeViewController

//overwrite init
-(instancetype)init{
    self = [super init];
    if (self) {
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Home" image:nil tag:0];
        self.title = @"Home";
        self.model = [[COModel alloc] init];
    }
    return self;
}

- (void)reload:(__unused id)sender {
    self.navigationItem.rightBarButtonItem.enabled = NO;
    
    NSURLSessionTask *task = [COModel globalTimelinePostsWithBlock:^(NSArray *posts, NSError *error) {
        if (!error) {
            self.model.BasicInfoArray = posts;
            [self.tableView reloadData];
        }else{
            UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Netwrok Error!" message:[NSString stringWithFormat:@"error code:%ld",[error code]] delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [alert show];
        }
    }];
    
    [self.refreshControl setRefreshingWithStateOfTask:task];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.refreshControl = [[UIRefreshControl alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.tableView.frame.size.width, 100.0f)];
    [self.refreshControl addTarget:self action:@selector(reload:) forControlEvents:UIControlEventValueChanged];
    [self.tableView.tableHeaderView addSubview:self.refreshControl];
    
    self.tableView.rowHeight = 70.0f;
    
    [self reload:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.model.BasicInfoArray count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    
    //reuse cell
    COTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        //load cell from ccb
        NSArray* array = [[NSBundle mainBundle] loadNibNamed:@"COTableViewCell" owner:self options:nil];
        cell = [array objectAtIndex:0];
    }

    cell.info = self.model.BasicInfoArray[(NSUInteger)indexPath.row];

    return cell;

}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(__unused UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    return [COTableViewCell heightForCellWithPost:self.model.BasicInfoArray[(NSUInteger)indexPath.row]];
    return 70;
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    COCourseViewController* vc = [[COCourseViewController alloc] initWithNibName:@"COCourseViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
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

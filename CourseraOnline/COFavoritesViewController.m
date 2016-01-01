//
//  COFavoritesViewController.m
//  CourseraOnline
//
//  Created by LinShan Jiang on 23/12/15.
//  Copyright © 2015年 LinShan Jiang. All rights reserved.
//

#import "COFavoritesViewController.h"
#import "COCoursesViewController.h"
#import "COFavorites.h"
#import "COCourses.h"
#import "COTableViewCell.h"

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

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[COFavorites sharedInstance].myFavorites count];
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
    
    cell.info = [[[COFavorites sharedInstance].myFavorites allObjects] objectAtIndex:(NSUInteger)indexPath.row];
    
    return cell;
    
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(__unused UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    COCoursesViewController* vc = [[COCoursesViewController alloc] init];
    COCourses* courses = [[COCourses alloc] initWithBasicInfo:[[[COFavorites sharedInstance].myFavorites allObjects] objectAtIndex:(NSUInteger)indexPath.row]];
    [vc setCourse:courses];
    [self.navigationController pushViewController:vc animated:YES];
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

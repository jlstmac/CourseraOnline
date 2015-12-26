//
//  COTableViewCell.h
//  CourseraOnline
//
//  Created by LinShan Jiang on 24/12/15.
//  Copyright © 2015年 LinShan Jiang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class COBasicInfo;

@interface COTableViewCell : UITableViewCell

@property(nonatomic,weak) IBOutlet UIImageView* iconImage;
@property(nonatomic,weak) IBOutlet UILabel* nameLabel;
@property(nonatomic,weak) IBOutlet UILabel* slugLabel;
@property(nonatomic,strong) COBasicInfo* info;

+ (CGFloat)heightForCellWithPost:(COBasicInfo *)post;
+ (CGFloat)heightForCell;
@end

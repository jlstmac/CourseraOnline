//
//  COTableViewCell.m
//  CourseraOnline
//
//  Created by LinShan Jiang on 24/12/15.
//  Copyright © 2015年 LinShan Jiang. All rights reserved.
//

#import "COTableViewCell.h"
#import "COBasicInfo.h"
#import "UIKit+AFNetworking.h"

@implementation COTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return nil;
    }
    
    self.selectionStyle = UITableViewCellSelectionStyleGray;
    
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setInfo:(COBasicInfo *)info{
    _info = info;
    self.nameLabel.text = info.Name;
    self.slugLabel.text = info.Slug;
    [self.iconImage setImageWithURL:info.PhotoUrl placeholderImage:nil];
}

+ (CGFloat)heightForCell{
    return 70;
}

+ (CGFloat)heightForCellWithPost:(COBasicInfo *)post {
    return (CGFloat)fmaxf(70.0f, (float)[self detailTextHeight:post.Name] + 45.0f);
}

+ (CGFloat)detailTextHeight:(NSString *)text {
    CGRect rectToFit = [text boundingRectWithSize:CGSizeMake(240.0f, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:12.0f]} context:nil];
    return rectToFit.size.height;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

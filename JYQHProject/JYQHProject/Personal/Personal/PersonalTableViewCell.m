//
//  PersonalTableViewCell.m
//  JYQHProject
//
//  Created by user on 2017/7/7.
//  Copyright © 2017年 zero. All rights reserved.
//

#import "PersonalTableViewCell.h"

@interface PersonalTableViewCell()


@end

@implementation PersonalTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    [self setupViews];
    [self setupViews];
    return [super initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIdentifier];
}
-(void)setupViews{
    
    self.textLabel.textColor = RGB(49, 49, 49);
    self.detailTextLabel.font = [UIFont systemFontOfSize:12];
    self.detailTextLabel.textColor = RGB(125, 125, 125);
    self.detailTextLabel.backgroundColor = [UIColor greenColor];
    self.imageView.frame = CGRectMake(10, 5, 34, 34);
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //显示最右边的箭头
    
}
-(void)updateConstraints{
    [super updateConstraints];
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

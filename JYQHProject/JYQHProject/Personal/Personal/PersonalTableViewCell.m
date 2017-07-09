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
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //显示最右边的箭头
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
}

-(void)updateConstraints{
    [super updateConstraints];
    WS(weakSelf)
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf).with.offset(16);
        make.centerY.equalTo(weakSelf);
        make.size.mas_offset(CGSizeMake(18, 18));
    }];
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.imageView.mas_right).with.offset(10);
        make.centerY.equalTo(weakSelf);
        make.size.mas_offset(CGSizeMake(100, 20));
    }];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

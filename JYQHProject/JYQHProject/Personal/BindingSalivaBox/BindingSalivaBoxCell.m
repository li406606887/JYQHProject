//
//  BindingSalivaBoxCell.m
//  JYQHProject
//
//  Created by user on 2017/7/8.
//  Copyright © 2017年 zero. All rights reserved.
//

#import "BindingSalivaBoxCell.h"

@interface BindingSalivaBoxCell()
@property(nonatomic,strong)UIImageView *icon;
@end

@implementation BindingSalivaBoxCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    [self setupViews];
    [self setupViews];
    return [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
}
-(void)setupViews{
    
    self.textLabel.textColor = RGB(125, 125, 125);
    self.textLabel.font = [UIFont systemFontOfSize:14];
    self.detailTextLabel.textColor = RGB(125, 125, 125);
    self.detailTextLabel.font = [UIFont systemFontOfSize:14];
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //显示最右边的箭头
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
}
-(void)updateConstraints{
    [super updateConstraints];
    WS(weakSelf)
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.contentView).with.offset(16);
        make.top.equalTo(weakSelf.contentView).with.offset(10);
        make.size.mas_offset(CGSizeMake(50, 50));
    }];
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.imageView.mas_right).with.offset(16);
        make.top.equalTo(weakSelf.contentView).with.offset(10);
        make.size.mas_offset(CGSizeMake(200, 20));
    }];
    [self.detailTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.imageView.mas_right).with.offset(16);
        make.top.equalTo(weakSelf.textLabel.mas_bottom).with.offset(5);
        make.size.mas_offset(CGSizeMake(200, 20));
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

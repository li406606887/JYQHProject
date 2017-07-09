//
//  PersonalHeadView.m
//  JYQHProject
//
//  Created by user on 2017/7/7.
//  Copyright © 2017年 zero. All rights reserved.
//

#import "PersonalHeadView.h"
#import "PersonalViewModel.h"

@interface PersonalHeadView()
@property(nonatomic,strong)UIImageView *icon;
@property(nonatomic,strong)UIImageView *backgroundView;
@property(nonatomic,strong)UILabel *nameTitle;
@property(nonatomic,strong)PersonalViewModel *viewModel;
@end

@implementation PersonalHeadView

-(instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel{
    self.viewModel = (PersonalViewModel *)viewModel;
    return [super initWithViewModel:viewModel];
}
-(void)setupViews{
    [self addSubview:self.backgroundView];
    [self addSubview:self.icon];
    [self addSubview:self.nameTitle];
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
}
-(void)updateConstraints{
    [super updateConstraints];
    WS(weakSelf)
    [self.backgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf);
    }];
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf).with.offset(10);
        make.centerY.equalTo(weakSelf).with.offset(10);
        make.size.mas_offset(CGSizeMake(60, 60));
    }];
    
    [self.nameTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.icon.mas_right).with.offset(10);
        make.centerY.equalTo(weakSelf.icon);
        make.size.mas_offset(CGSizeMake(200, 60));
    }];
    
}
-(UIImageView *)backgroundView{
    if (!_backgroundView) {
        _backgroundView = [[UIImageView alloc] init];
        _backgroundView.image = [UIImage imageNamed:@"Personal_Table_Head"];
    }
    return _backgroundView;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(UIImageView *)icon{
    if (!_icon) {
        _icon = [[UIImageView alloc] init];
        _icon.layer.masksToBounds = YES;
        _icon.layer.cornerRadius = 30;
        _icon.backgroundColor = [UIColor greenColor];
    }
    return _icon;
}
-(UILabel *)nameTitle{
    if (!_nameTitle) {
        _nameTitle = [[UILabel alloc] init];
        _nameTitle.text = @"striking";
        _nameTitle.font = [UIFont systemFontOfSize:14];
    }
    return _nameTitle;
}
@end

//
//  PersonalView.m
//  JYQHProject
//
//  Created by user on 2017/7/7.
//  Copyright © 2017年 zero. All rights reserved.
//

#import "PersonalView.h"
#import "PersonalTableViewCell.h"
#import "PersonalHeadView.h"
#import "PersonalViewModel.h"

@interface PersonalView()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)PersonalHeadView *personalView;
@property(nonatomic,strong)PersonalViewModel *viewModel;
@property(nonatomic,strong)UIView *headView;
@property(nonatomic,strong)UITableView *table;
@property(nonatomic,strong)NSArray *titleArray;
@property(nonatomic,strong)NSArray *imageArray;
@property(nonatomic,strong)NSArray *detailArray;

@end

@implementation PersonalView

-(instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel{
    self.viewModel = (PersonalViewModel*)viewModel;
    return [super initWithViewModel:viewModel];
}
-(void)setupViews{
    [self addSubview:self.table];
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
}
-(void)updateConstraints{
    [super updateConstraints];
    WS(weakSelf)
    [self.table mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf);
    }];
    [self.personalView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.headView);
    }];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.5f;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.titleArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PersonalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithUTF8String:object_getClassName([PersonalTableViewCell class])]];
    cell.imageView.image = [UIImage imageNamed:self.imageArray[indexPath.row]];
    cell.textLabel.text = self.titleArray[indexPath.row];
    cell.detailTextLabel.text = self.detailArray[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.viewModel.personalCellClick sendNext:[NSString stringWithFormat:@"%ld",indexPath.row]];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(UITableView *)table{
    if (!_table) {
        _table = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _table.delegate = self;
        _table.dataSource = self;
        
        _table.tableHeaderView = self.headView;
        [_table registerClass:[PersonalTableViewCell class] forCellReuseIdentifier:[NSString stringWithUTF8String:object_getClassName([PersonalTableViewCell class])]];
        
    }
    return _table;
}
-(NSArray *)titleArray{
    if (!_titleArray) {
        _titleArray = [NSArray arrayWithObjects:@"采集管绑定",@"收货地址",@"历史订单",@"赚取现金",@"优惠券",@"我的发票",@"用户反馈",@"联系我们",nil];
    }
    return _titleArray;
}
-(NSArray *)imageArray{
    if (!_imageArray) {
        _imageArray = [NSArray arrayWithObjects:@"Personal_Table_Box",@"Personal_Table_Adress",@"Personal_Table_History",@"Personal_Table_Invite",@"Personal_Table_Ticket",@"Personal_Table_Bill",@"Personal_Table_Feedback",@"Personal_Table_Contact", nil];
    }
    return _imageArray;
}
-(NSArray *)detailArray{
    if (!_detailArray) {
        _detailArray = [NSArray arrayWithObjects:@"0个采集管",@"",@"",@"",@"您有0张优惠券即将过期",@"",@"",@"", nil];
    }
    return _detailArray;
}
-(PersonalHeadView *)personalView{
    if (!_personalView) {
        _personalView = [[PersonalHeadView alloc] initWithViewModel:self.viewModel];
    }
    return _personalView;
}
-(UIView *)headView{
    if (!_headView) {
        _headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.31)];
        [_headView addSubview:self.personalView];
    }
    return _headView;
}
@end

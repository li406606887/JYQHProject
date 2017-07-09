//
//  BindingSalivaBoxView.m
//  JYQHProject
//
//  Created by user on 2017/7/8.
//  Copyright © 2017年 zero. All rights reserved.
//

#import "BindingSalivaBoxView.h"
#import "BindingSalivaBoxViewModel.h"
#import "BindingSalivaBoxModel.h"
#import "BindingSalivaBoxCell.h"

@interface BindingSalivaBoxView()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)BindingSalivaBoxViewModel *viewModel;
@property(nonatomic,strong)UITableView *table;
@property(nonatomic,strong)UIButton *bindSalivaBoxBtn;
@end

@implementation BindingSalivaBoxView

-(instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel{
    self.viewModel = (BindingSalivaBoxViewModel*)viewModel;
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
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.5f;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BindingSalivaBoxCell *cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithUTF8String:object_getClassName([BindingSalivaBoxCell class])]];
    cell.imageView.image = [UIImage imageNamed:@"Personal_Table_Adress"];
    cell.textLabel.text = [NSString stringWithFormat:@"受检者:张三"];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"订单状态:已发货"];
    return cell;
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
        UIView *foot = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
        _table.tableFooterView =foot;
        [foot addSubview:self.bindSalivaBoxBtn];
        [self.bindSalivaBoxBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(foot);
            make.top.equalTo(foot);
            make.size.mas_offset(CGSizeMake(150, 40));
        }];
        [_table registerClass:[BindingSalivaBoxCell class] forCellReuseIdentifier:[NSString stringWithUTF8String:object_getClassName([BindingSalivaBoxCell class])]];
    }
    return _table;
}
-(UIButton *)bindSalivaBoxBtn{
    if (!_bindSalivaBoxBtn) {
        _bindSalivaBoxBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_bindSalivaBoxBtn setTitle:@"+绑定唾液盒" forState:UIControlStateNormal];
        [_bindSalivaBoxBtn setBackgroundColor:RGB(25, 164, 186)];
        _bindSalivaBoxBtn.layer.masksToBounds = YES;
        _bindSalivaBoxBtn.layer.cornerRadius = 20;
        
    }
    return _bindSalivaBoxBtn;
}
@end

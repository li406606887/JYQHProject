//
//  BindingSalivaBoxViewController.m
//  JYQHProject
//
//  Created by user on 2017/7/8.
//  Copyright © 2017年 zero. All rights reserved.
//

#import "BindingSalivaBoxViewController.h"
#import "BindingSalivaBoxView.h"
#import "BindingSalivaBoxViewModel.h"

@interface BindingSalivaBoxViewController ()
@property(nonatomic,strong)BindingSalivaBoxViewModel *viewModel;
@property(nonatomic,strong)BindingSalivaBoxView *bindingSalivaBoxView;
@end

@implementation BindingSalivaBoxViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitle:@"我的采集管"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)addChildView{
    [self.view addSubview:self.bindingSalivaBoxView];
}
-(void)updateViewConstraints{
    [super updateViewConstraints];
    WS(weakSelf)
    [self.bindingSalivaBoxView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.view);
    }];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(BindingSalivaBoxView *)bindingSalivaBoxView{
    if (!_bindingSalivaBoxView) {
        _bindingSalivaBoxView = [[BindingSalivaBoxView alloc] initWithViewModel:self.viewModel];
    }
    return _bindingSalivaBoxView;
}
-(BindingSalivaBoxViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[BindingSalivaBoxViewModel alloc] init];
    }
    return _viewModel;
}
@end

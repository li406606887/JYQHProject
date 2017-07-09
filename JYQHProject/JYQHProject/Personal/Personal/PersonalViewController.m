//
//  PersonalViewController.m
//  JYQHProject
//
//  Created by user on 2017/7/6.
//  Copyright © 2017年 zero. All rights reserved.
//

#import "PersonalViewController.h"
#import "OrderHistoryViewController.h"
#import "PersonalView.h"
#import "PersonalViewModel.h"
#import "BindingSalivaBoxViewController.h"


@interface PersonalViewController ()
@property(nonatomic,strong)PersonalView *personalView;
@property(nonatomic,strong)PersonalViewModel *viewModel;
@end

@implementation PersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}
-(void)addChildView{
    [self.view addSubview:self.personalView];
}
-(void)updateViewConstraints{
    [super updateViewConstraints];
    WS(weakSelf)
    [self.personalView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.view);
    }];
    
}
-(void)bindViewModel{
    [[self.viewModel.personalCellClick takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id  _Nullable x) {
        switch ([x intValue]) {
            case 0:{
                BindingSalivaBoxViewController *bindingBox = [[BindingSalivaBoxViewController alloc] init];
                [self.navigationController pushViewController:bindingBox animated:YES];
            }
                break;
            case 1:
                
                break;
            case 2:
                
                break;
            case 3:
                
                break;
            case 4:
                
                break;
            case 5:
                
                break;
            case 6:
                
                break;
            case 7:
                
                break;
                
            default:
                break;
        }
    }];
}
-(void)sadsd{
    
    OrderHistoryViewController *order = [[OrderHistoryViewController alloc] init];
    [self.navigationController pushViewController:order animated:YES];
    
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
-(PersonalView *)personalView{
    if (!_personalView) {
        _personalView = [[PersonalView alloc] initWithViewModel:self.viewModel];;
    }
    return _personalView;
}
-(PersonalViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[PersonalViewModel alloc] init];
    }
    return _viewModel;
}
@end

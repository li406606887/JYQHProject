//
//  ViewBaseController.m
//  RDFuturesApp
//
//  Created by user on 17/2/28.
//  Copyright © 2017年 FuturesApp. All rights reserved.
//

#import "ViewBaseController.h"
#import "HomeViewController.h"
#import "PersonalViewController.h"


@interface ViewBaseController ()
@end

@implementation ViewBaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpNavigationBar];
    
    [self.tabBarController.tabBar setHidden:YES];
    self.view.backgroundColor= [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}



- (void) setUpNavigationBar
{
    
//    self.navigationController.navigationBar.shadowImage = [UIImage new];
//    
//    设置导航栏左边按钮
    self.navigationItem.leftBarButtonItem = [self backButton];//设置导航栏右边按钮
    
   //    self.navigationItem.titleView = [self centerView];//设置titel
//    if([[[UIDevice currentDevice]systemVersion]floatValue]>=7.0)
//    {
//        self.edgesForExtendedLayout = UIRectEdgeNone;
//        self.automaticallyAdjustsScrollViewInsets = NO;
//    }
//    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
//    gradientLayer.colors = @[(__bridge id)RGB(202, 165, 108).CGColor, (__bridge id)RGB(173, 130, 66).CGColor];
//    gradientLayer.locations = @[@0.1, @1.0];
//    gradientLayer.startPoint = CGPointMake(0, 0);
//    gradientLayer.endPoint = CGPointMake(1.0, 0);
//    gradientLayer.frame = CGRectMake(0, -20, SCREEN_WIDTH, 64);
//    [self.navigationController.navigationBar.layer addSublayer:gradientLayer];
    
}

- (UIBarButtonItem *)backButton
{
    UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 31, 28)];
    [btn setImage:[UIImage imageNamed:@"Navigation_Back_Icon"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    btn.tag = 0;
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
    
}
-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

+(instancetype)allocWithZone:(struct _NSZone *)zone{
    ViewBaseController *vc = [super allocWithZone:zone];
    @weakify(vc);
    [[vc rac_signalForSelector:@selector(viewDidLoad)] subscribeNext:^(id x) {
        @strongify(vc)
        [vc addChildView];
        [vc bindViewModel];
    }];
    
    [[vc rac_signalForSelector:@selector(viewWillAppear:)] subscribeNext:^(id x) {
        
        
    }];
    
    return vc;
}




-(void)addChildView{
    
}
-(void)bindViewModel{
    
}

@end

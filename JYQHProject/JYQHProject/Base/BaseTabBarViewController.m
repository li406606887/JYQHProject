//
//  BaseTabBarViewController.m
//  JYQHProject
//
//  Created by user on 2017/7/6.
//  Copyright © 2017年 zero. All rights reserved.
//

#import "BaseTabBarViewController.h"
#import "HomeViewController.h"
#import "PersonalViewController.h"

@interface BaseTabBarViewController ()

@end

@implementation BaseTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setChildViewController];
    [self setNavigationBarItem];
}
-(void)setNavigationBarItem{
    self.navigationItem.leftBarButtonItem = [self leftButton];
    self.navigationItem.rightBarButtonItem = [self rightButton];
    self.navigationItem.titleView = [self centerView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setChildViewController{
    HomeViewController *home = [[HomeViewController alloc] init];
    home.tabBarItem.title = @"首页";
    home.tabBarItem.image = [[UIImage imageNamed:@"NavigationBar_Home"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:home];
    PersonalViewController *personal = [[PersonalViewController alloc] init];
    personal.tabBarItem.title = @"个人";
    personal.tabBarItem.image = [[UIImage imageNamed:@"NavigationBar_Home"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:home];
    [self addChildViewController:personal];
    
}

- (UIBarButtonItem *)leftButton
{
    UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 31, 28)];
    [btn setImage:[UIImage imageNamed:@"NavigationBar_Home"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(actionOnTouchBackButton:) forControlEvents:UIControlEventTouchUpInside];
    btn.tag = 1;
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
    
}

- (UIBarButtonItem *)rightButton
{
    UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 28)];
    [btn setImage:[UIImage imageNamed:@"NavigationBar_Personal"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(actionOnTouchBackButton:) forControlEvents:UIControlEventTouchUpInside];
    btn.tag = 2;
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

- (UIView *)centerView
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 117, 30)];
    [imageView setImage:[UIImage imageNamed:@"NavigationBar_TitleView"]];
    return imageView;
}


- (void)actionOnTouchBackButton:(UIButton*)sender
{
    int index = (int)sender.tag;
    switch (index) {
       
        case 1:
                        self.selectedIndex = 0;
            break;
        case 2:
                        self.selectedIndex = 1;
            break;
        default:
            break;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

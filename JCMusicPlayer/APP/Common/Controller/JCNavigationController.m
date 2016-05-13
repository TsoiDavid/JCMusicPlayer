//
//  JCNavigationController.m
//  course
//
//  Created by TsoiKaShing on 15/11/21.
//  Copyright © 2015年 Yes_3D. All rights reserved.
//


#import "JCNavigationController.h"
#import "UIBarButtonItem+Extension.h"
#import "MusicNavagationView.h"
#import "MusicPlayerViewController.h"
//导航条高度
static const CGFloat navHeadViewHight = 64;

@interface JCNavigationController ()

@property (strong,nonatomic) MusicNavagationView *navHeadView;

@end

@implementation JCNavigationController

+ (void)initialize
{
    
    // 设置整个项目所有item的主题样式
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    
    // 设置普通状态
    // key：NS****AttributeName
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    // 设置不可用状态
    NSMutableDictionary *disableTextAttrs = [NSMutableDictionary dictionary];
    disableTextAttrs[NSForegroundColorAttributeName] = [UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:0.7];
    disableTextAttrs[NSFontAttributeName] = textAttrs[NSFontAttributeName];
    [item setTitleTextAttributes:disableTextAttrs forState:UIControlStateDisabled];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
}

/**
 *  重写这个方法目的：能够拦截所有push进来的控制器
 *
 *  @param viewController 即将push进来的控制器
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    if (self.viewControllers.count > 0) { // 这时push进来的控制器viewController，不是第一个子控制器（不是根控制器）
        /* 自动显示和隐藏tabbar */
        viewController.hidesBottomBarWhenPushed = YES;
        /* 设置导航栏上面的内容 */
        // 设置左边的返回按钮
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"cm2_mv_btn_back_prs" highImage:@"cm2_mv_btn_back_prs"];

        
        if ([viewController isKindOfClass:[MusicPlayerViewController class]]) {
            self.navigationBar.hidden = YES;
            [self.view addSubview:self.navHeadView];
        }else {
            self.navigationBar.hidden = NO;
            [_navHeadView removeFromSuperview];
        }
        
        
        
//        viewController.navigationController.navigationBar
//         设置右边的更多按钮
//        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(more) image:@"navigationbar_more" highImage:@"navigationbar_more_highlighted"];
    }
    
    [super pushViewController:viewController animated:animated];
}

- (void)back
{
#warning 这里要用self，不是self.navigationController
    // 因为self本来就是一个导航控制器，self.navigationController这里是nil的
    [self popViewControllerAnimated:YES];
}

- (void)more
{
    [self popToRootViewControllerAnimated:YES];
}

- (void)setTitle:(NSString *)title {
    self.navHeadView.titleString = title;
}
#pragma mark - CoustomNavagationView

- (MusicNavagationView *)navHeadView {
    if (!_navHeadView) {
        _navHeadView = [MusicNavagationView instanceView];
        __weak typeof(self)weakSelf = self;
        _navHeadView.frame = CGRectMake(0, 0, self.view.frame.size.width, navHeadViewHight);
        [_navHeadView back:^{
            [weakSelf back];
        } RightButtonBlcok:^{
            NSLog(@"RightButton Click");
        }];
    }
    return _navHeadView;
}


@end

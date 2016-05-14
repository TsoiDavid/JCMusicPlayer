//
//  JCNavigationBar.h
//  JCMusicPlayer
//
//  Created by TsoiKaShing on 16/5/13.
//  Copyright © 2016年 Tsoi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JCNavigationBar : UINavigationBar
#pragma mark - attribute
/**
 *  导航栏是否为透明 默认NO
 */
@property (assign,nonatomic) BOOL transparent;
/**
 *  是否导航栏透明后下方的线 默认NO
 */
@property (assign,nonatomic) BOOL hiddenbuttomLine;
/**
 *  导航栏底部线颜色
 */
@property (strong,nonatomic) UIColor *buttomLineColor;
/**
 *  背景颜色
 */
@property (strong,nonatomic) UIColor *navbackGroundColor;
/**
 *  导航标题
 */
@property (strong,nonatomic) NSString *title;
/**
 *  导航标题图片
 */
@property (strong,nonatomic) UIView *titleView;

#pragma mark - method
/**
 *  构造方法
 *
 *  @param navController 导航控制器
 *  @param title         导航栏title，默认为@""
 *  @param frame         NavigationBar Frame
 *
 *  @return NavagationBar
 */
- (instancetype)initWithNavigationController:(UINavigationController *)navController Title:(NSString *)title Frame:(CGRect)frame;
/**
 *  返回按钮Block
 */
@property (copy,nonatomic) void (^backBlock)();
/**
 *  右边按钮Block
 */
@property (copy,nonatomic) void (^rightButtonBlcok)();
/**
 *  销毁
 */
- (void)disMiss;
@end

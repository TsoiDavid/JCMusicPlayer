//
//  JCNavigationBar.m
//  JCMusicPlayer
//
//  Created by TsoiKaShing on 16/5/13.
//  Copyright © 2016年 Tsoi. All rights reserved.
//

#import "JCNavigationBar.h"

@interface JCNavigationBar()

@property (strong,nonatomic) UINavigationItem *item;
@property (strong,nonatomic) UINavigationController *navController;
@property (strong,nonatomic) UIImage *buttomImage;

@end

@implementation JCNavigationBar

- (instancetype)initWithNavigationController:(UINavigationController *)navController Title:(NSString *)title Frame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        //默认值
        self.navController = navController;
        self.title = title.length > 0 ? title : @"";
        
        [self setUI];
        //设置默认值
        [self setNormalAttribute];
    }
    return self;
}
- (void)setNormalAttribute {
    self.transparent = NO;
    self.hiddenbuttomLine = NO;
    
}
- (void)setUI {
//
//    self.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];

    
    _item = [[UINavigationItem alloc]initWithTitle:_title];
    self.items = @[_item];

    _item.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"cm2_mv_btn_back_prs" highImage:@"cm2_mv_btn_back_prs"];
    _item.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(menu) image:@"menu" highImage:@"menu"];
}

#pragma mark - 属性设置
- (void)setButtomLineColor:(UIColor *)buttomLineColor {
    _buttomLineColor = buttomLineColor;
    if (![self refreshButtonLine]) {
        NSLog(@"创造不出图片");
    }
    self.shadowImage = [self refreshButtonLine];
   
}
- (UIImage *)refreshButtonLine {
   //创建一个高度为1的image来做navigationbar的buttomLine
    _buttomImage = [UIImage setBackgroundImageByColor:_buttomLineColor withFrame:CGRectMake(0, 0, 2, 1)];
    return _buttomImage;
}
- (void)setTransparent:(BOOL)transparent {
    _transparent = transparent;
    if (!_transparent) {
        self.backgroundColor = [UINavigationBar appearance].backgroundColor;
    }else {
        //    导航栏变为透明
        [self setBackgroundImage:[UIImage new] forBarMetrics:0];
        self.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0];
    }

}
- (void)setHiddenbuttomLine:(BOOL)hiddenbuttomLine {
    _hiddenbuttomLine = hiddenbuttomLine;
    if (_hiddenbuttomLine) {
        //让黑线消失的方法
        self.shadowImage = [UIImage new];
    }else {
        //给予默认值
        _buttomImage = _buttomImage?_buttomImage:[UIImage setBackgroundImageByColor:[UIColor grayColor] withFrame:CGRectMake(0, 0, 1, 1)];
        self.shadowImage = _buttomImage;
    }
}

-(void)setNavbackGroundColor:(UIColor *)navbackGroundColor {
    _navbackGroundColor = navbackGroundColor;
    self.backgroundColor = _navbackGroundColor;
    
}
- (void)setTitle:(NSString *)title {
    _title = title;
    _item.title = _title;
}
- (void)setTitleView:(UIView *)titleView {
    _titleView = titleView;
    _item.titleView = _titleView;
}
- (void)setBackBlock:(void (^)())backBlock {
    _backBlock = backBlock;
}
- (void)setRightButtonBlcok:(void (^)())rightButtonBlcok {
    _rightButtonBlcok = rightButtonBlcok;
}
- (void)back:(void (^)())backBlock RightButtonBlcok:(void (^)())rightButtonBlcok {
    _backBlock = backBlock;
    _rightButtonBlcok = rightButtonBlcok;
}
- (void)menu {
    NSLog(@"menu");
    if (_rightButtonBlcok) {
        NSLog(@"rightButtonBlock receive operation command");
        _rightButtonBlcok();
    }
}
- (void)back {
    NSLog(@"back");
    if (_backBlock) {
        NSLog(@"backBlock receive operation command");
        _backBlock();
    }else {
        [self.navController popToRootViewControllerAnimated:YES];
    }
}
- (void)disMiss {
    [self removeFromSuperview];
}
@end

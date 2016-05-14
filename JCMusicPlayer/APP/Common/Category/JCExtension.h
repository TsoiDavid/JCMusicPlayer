//
//  JCExtension.h
//  JCMusicPlayer
//
//  Created by TsoiKaShing on 16/5/13.
//  Copyright © 2016年 Tsoi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JCExtension : NSObject

@end

#pragma mark - UIBarButtonItem

@interface UIBarButtonItem (Extension)
/**
 *  添加导航图片按钮
 *
 *  @param target    执行按钮方法的对象
 *  @param action    按钮方法
 *  @param image     按钮图片
 *  @param highImage 按钮高亮图片
 *
 *  @return 导航按钮
 */
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage;
/**
 *  添加导航文字按钮
 *
 *  @param target 执行按钮方法的对象
 *  @param action 按钮方法
 *  @param title  按钮文字
 *  @param color  按钮文字颜色
 *
 *  @return 导航按钮
 */
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action title:(NSString *)title titleColor:(UIColor *)color;
@end

#pragma mark - UIView

@interface UIView (Extension)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint origin;

@end

@interface UIColor (Extend)


/**************************************************************
 ** 功能:     颜色转换
 ** 参数:     （html数据 转换为颜色）
 ** 返回:     UIColor
 **************************************************************/
- (UIColor *)hexStringToColor:(NSString *)stringToConvert;

- (UIColor *)rgbToColorRed:(CGFloat)red Green:(CGFloat)green Blue:(CGFloat)blue;
@end

#pragma mark - UIImage

@interface UIImage (Extend)

+ (UIImage* )setBackgroundImageByColor:(UIColor *)backgroundColor withFrame:(CGRect )rect;
/**
 *  改变图片颜色
 *
 *  @param tintColor 图片颜色
 *  @param img       图片
 *  @param alpha     透明度
 *
 *  @return 图片
 */
- (UIImage *)imageWithTintColor:(UIColor *)tintColor image:(UIImage*)img alpha:(float)alpha;

@end

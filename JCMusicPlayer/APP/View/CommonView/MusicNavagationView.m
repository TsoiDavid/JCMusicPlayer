//
//  MusicNavagationView.m
//  JCMusicPlayer
//
//  Created by TsoiKaShing on 16/5/8.
//  Copyright © 2016年 Tsoi. All rights reserved.
//

#import "MusicNavagationView.h"
//头部字体大小
static const CGFloat titleFont = 17.0;
//状态栏20px
static const CGFloat statusBarHight = 20;

@interface MusicNavagationView ()

@property (strong,nonatomic) UILabel *titleLabel;

@end

@implementation MusicNavagationView

+(MusicNavagationView *)instanceView {
    NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"MusicNavagationView" owner:nil options:nil];
    
    return [nibView objectAtIndex:0];
    
}
- (void)awakeFromNib {
    
}
#pragma UI设置
//设置导航头部文字
- (void)setTitleString:(NSString *)titleString {
    _titleString = titleString;
    [self addSubview:self.titleLabel];
}
//加入导航头部文字Label
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.text = _titleString;
        _titleLabel.backgroundColor = [UIColor yellowColor];
        _titleLabel.font = [UIFont systemFontOfSize:titleFont];
        CGSize size = [_titleLabel sizeThatFits:CGSizeMake(MAXFLOAT, 50)];
        
        CGFloat limitWidth = self.frame.size.width - _backButton.frame.size.width * 2 - 20;//|lb-10-title-10-rb| 按钮两边留10边距
        
        CGFloat titleLabelY =  ((self.frame.size.height - statusBarHight)- size.height)/2 + statusBarHight;
        CGFloat titleLabelX =  (self.frame.size.width - size.width)/2;
        
        if (size.width <= limitWidth) {
            _titleLabel.frame = CGRectMake(titleLabelX, titleLabelY, size.width, size.height);
        }else {
            _titleLabel.frame = CGRectMake(titleLabelX, titleLabelY, size.width, size.height);
        }
    }
    return _titleLabel;
}
//设置导航背景颜色
- (void)setBackcroundColor:(UIColor *)backcroundColor {
    _backcroundColor = backcroundColor;
    self.backcroundColor = _backcroundColor;
}

#pragma mark - Action

- (void)back:(void (^)())backBlock RightButtonBlcok:(void (^)())rightButtonBlcok {
    _backBlock = backBlock;
    _rightButtonBlcok = rightButtonBlcok;
}

- (IBAction)backButtonAction {
    _backBlock();
}
- (IBAction)rightButtonAction {
    _rightButtonBlcok();
}

@end

//
//  MusicNavagationView.m
//  JCMusicPlayer
//
//  Created by TsoiKaShing on 16/5/8.
//  Copyright © 2016年 Tsoi. All rights reserved.
//

#import "MusicNavagationView.h"

@implementation MusicNavagationView

+(MusicNavagationView *)instanceView {
    NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"MusicNavagationView" owner:nil options:nil];
    
    return [nibView objectAtIndex:0];
    
}
- (void)awakeFromNib {
    
}
- (void)setTitleString:(NSString *)titleString {
    _titleString = titleString;
}
- (NSString *)title {
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.text = _titleString;
    CGSize size = [titleLabel sizeThatFits:CGSizeMake(MAXFLOAT, 20)];
    CGFloat limitWidth = self.frame.size.width - _backButton.frame.size.width * 2 - 20;//按钮两边留10边距
    if (size.width <= limitWidth) {
        titleLabel.frame = CGRectMake((self.frame.size.width - size.width)/2, 10, size.width, size.height);
    }
    return titleLabel;
}
@end

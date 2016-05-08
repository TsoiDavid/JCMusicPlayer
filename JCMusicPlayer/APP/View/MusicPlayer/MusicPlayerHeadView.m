//
//  MusicPlayerHeadView.m
//  JCMusicPlayer
//
//  Created by admin on 16/5/6.
//  Copyright © 2016年 Tsoi. All rights reserved.
//

#import "MusicPlayerHeadView.h"

@interface MusicPlayerHeadView ()
//歌名
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
//艺术家
@property (weak, nonatomic) IBOutlet UILabel *artistLabel;
@property (assign, nonatomic) CGSize titleSize;
@property (assign, nonatomic) CGSize artistSize;
@end

@implementation MusicPlayerHeadView

+(MusicPlayerHeadView *)instanceView {
    NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"MusicPlayerHeadView" owner:nil options:nil];
    
    return [nibView objectAtIndex:0];
    
}

- (void)setTitle:(NSString *)title {
    _title = title;
    [self refreshHeadViewFrame];
}

- (void)setArtist:(NSString *)artist {
    _artist = artist;
    [self refreshHeadViewFrame];
}

- (void)refreshHeadViewFrame {
    if (_title.length > 0 && _artist.length > 0) {
        _titleLabel.text = _title;
        _artistLabel.text = _artist;
        _titleSize = [_titleLabel sizeThatFits:CGSizeMake(MAXFLOAT, 20)];
        _artistSize = [_artistLabel sizeThatFits:CGSizeMake(MAXFLOAT, 20)];
        CGFloat headViewW = _titleSize.width > _artistSize.width?_titleSize.width :_artistSize.width ;
        self.frame = CGRectMake(0, 0,headViewW, 49);
    }
    
    
}
- (void) awakeFromNib
{
    [super awakeFromNib];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

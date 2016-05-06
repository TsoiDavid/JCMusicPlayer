//
//  MusicPlayListCell.m
//  JCMusicPlayer
//
//  Created by admin on 16/5/6.
//  Copyright © 2016年 Tsoi. All rights reserved.
//

#import "MusicPlayListCell.h"
#import "MusicListItem.h"

@implementation MusicPlayListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _musicIndicatorView.hidden = YES;
    _musicIndicatorNumberLabel.hidden = YES;
   
}
- (void)setMusicList:(MusicListItem *)musicList {
    _musicList = musicList;
    
    _musicName.text = _musicList.title;
    _musicInfo.text = _musicList.artist;
    
    if (_musicList.state != MusicPlaying) {
        _musicIndicatorView.hidden = YES;
        _musicIndicatorNumberLabel.hidden = NO;
        _musicIndicatorNumberLabel.text = [NSString stringWithFormat:@"%ld",(long)_musicList.musicListNumber];
    }else {
        _musicIndicatorView.hidden = NO;
        _musicIndicatorNumberLabel.hidden = YES;
        _musicIndicatorView.image = [UIImage imageNamed:@"cm2_icn_volume"];
    }
    
    
}
- (void)refreshMusicState {
    
    if (_musicList.state == MusicPlaying) {
        _musicIndicatorView.hidden = NO;
        _musicIndicatorNumberLabel.hidden = YES;
    }else {
        _musicIndicatorView.hidden = YES;
        _musicIndicatorNumberLabel.hidden = NO;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

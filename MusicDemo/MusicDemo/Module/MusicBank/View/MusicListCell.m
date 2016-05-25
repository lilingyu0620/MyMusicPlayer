//
//  MusicListCell.m
//  MusicDemo
//
//  Created by lly on 16/4/16.
//  Copyright © 2016年 lly. All rights reserved.
//

#import "MusicListCell.h"

@implementation MusicListCell
{

    BOOL _selected;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
//    self.favoriteBtn.particleImage = [UIImage imageNamed:@"song_list_item_inlove.png"];
    self.favoriteBtn.particleScale = 0.05;
    self.favoriteBtn.particleScaleRange = 0.02;
    [self.favoriteBtn setImage:[UIImage imageNamed:@"song_list_item_inlove"] forState:UIControlStateNormal];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(MusicModel *)model{

    self.favoriteNumLabel.text = model.favorites;
    self.songNameLabel.text = model.name;
    self.singerLable.text = model.singerName;
}
- (IBAction)favoriteBtnClicked:(id)sender {
    _selected = !_selected;
    if (!_selected) {
        [self.favoriteBtn popInsideWithDuration:0.4];
    }
    else{
    
        [self.favoriteBtn popOutsideWithDuration:0.5];
    }
    
}

@end

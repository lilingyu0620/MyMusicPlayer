//
//  MusicListCell.h
//  MusicDemo
//
//  Created by lly on 16/4/16.
//  Copyright © 2016年 lly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MusicModel.h"
#import "MCFireworksButton.h"

@interface MusicListCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *favoriteNumLabel;
@property (weak, nonatomic) IBOutlet UILabel *songNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *singerLable;

- (void)setModel:(MusicModel *)model;
@property (weak, nonatomic) IBOutlet MCFireworksButton *favoriteBtn;

@end

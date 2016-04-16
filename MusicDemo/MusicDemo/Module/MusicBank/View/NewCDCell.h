//
//  NewCDCell.h
//  MusicDemo
//
//  Created by lly on 16/4/15.
//  Copyright © 2016年 lly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewCDModel.h"

@interface NewCDCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *singerLabel;


- (void)setModel:(NewCDModel *)model;
@end

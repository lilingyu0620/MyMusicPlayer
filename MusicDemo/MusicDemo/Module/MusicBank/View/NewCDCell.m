//
//  NewCDCell.m
//  MusicDemo
//
//  Created by lly on 16/4/15.
//  Copyright © 2016年 lly. All rights reserved.
//

#import "NewCDCell.h"

@implementation NewCDCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setModel:(NewCDModel *)model{

    [_imageView setImageURL:[NSURL URLWithString:model.pic]];
    NSArray *titleArray = [model.title componentsSeparatedByString:@"- "];
    self.titleLabel.text = titleArray[1];
    self.singerLabel.text = titleArray[0];

}

@end

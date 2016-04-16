//
//  MusicBankTypeCell.h
//  MusicDemo
//
//  Created by lly on 16/4/15.
//  Copyright © 2016年 lly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MusicBankTypeModel.h"
@interface MusicBankTypeCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *typeImageView;

@property (weak, nonatomic) IBOutlet UILabel *typeLabel;

+ (CGFloat)cellHeight;

- (void)setModel:(MusicBankTypeModel *)model;
@end

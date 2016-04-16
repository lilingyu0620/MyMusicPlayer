//
//  MusicBankTypeCell.m
//  MusicDemo
//
//  Created by lly on 16/4/15.
//  Copyright © 2016年 lly. All rights reserved.
//

#import "MusicBankTypeCell.h"

@implementation MusicBankTypeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (CGFloat)cellHeight{

    return 129.f;
}

- (void)setModel:(MusicBankTypeModel *)model{

    self.typeLabel.text = model.typeName;
    self.typeImageView.layer.cornerRadius = 3.0f;
    self.typeImageView.layer.masksToBounds = YES;

    [_typeImageView setImage:[UIImage imageNamed:model.typeImageName]];
}
@end

//
//  MusicListHeaderCell.m
//  MusicDemo
//
//  Created by lly on 16/4/16.
//  Copyright © 2016年 lly. All rights reserved.
//

#import "MusicListHeaderCell.h"

@implementation MusicListHeaderCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    if (self) {
        CGPoint point = [self center];
        NSLog(@"=======self center.x = %f center.y = %f======",point.x,point.y);
        
        CGPoint imageViewPoint = self.cornerImageView.center;
        NSLog(@"=======imageView center.x = %f center.y = %f=======",imageViewPoint.x,imageViewPoint.y);
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(NSDictionary *)headDic{

//    [self.backgroundImageView setImageWithURL:nil placeholder:[UIImage imageNamed:@"default"]];
//    [self.cornerImageView setImageWithURL:nil placeholder:[UIImage imageNamed:@"default"]];
    self.cornerImageView.layer.cornerRadius = self.cornerImageView.frame.size.width/2;
    self.cornerImageView.layer.masksToBounds = YES;
    
}

+ (CGFloat)cellHeight{

    return 160.f;
}
@end

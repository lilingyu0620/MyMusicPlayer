//
//  BaseVC.h
//  MusicDemo
//
//  Created by lly on 16/4/16.
//  Copyright © 2016年 lly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseVC : UIViewController


/**
 *  导航栏标题
 */
@property (nonatomic,strong) UILabel *mLabelTitle;

/**
 *  设置导航栏标题,在viewDidLoad中调用,如果不是单一问题则不需要调用
 */
- (void)setNavigationTitle:(NSString *)title;


@end

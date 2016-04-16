//
//  BaseVC.m
//  MusicDemo
//
//  Created by lly on 16/4/16.
//  Copyright © 2016年 lly. All rights reserved.
//

#import "BaseVC.h"

@interface BaseVC ()

@end

@implementation BaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UIImage *backImage = [UIImage imageNamed:@"back"];
    UIButton *btnBackItem = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnBackItem setImage:backImage forState:UIControlStateNormal];
    [btnBackItem setFrame:CGRectMake(0, 0, 68, 44)];
    btnBackItem.contentEdgeInsets = UIEdgeInsetsMake(12, 0, 12, 58);
    [btnBackItem addTarget:self action:@selector(backItemAction) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btnBackItem];
    
    
    self.mLabelTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    self.mLabelTitle.font = [UIFont boldSystemFontOfSize:17];
    self.mLabelTitle.textColor = RGBCOLOR(35, 39, 42);
    self.mLabelTitle.backgroundColor = [UIColor clearColor];
    self.mLabelTitle.textAlignment = NSTextAlignmentCenter;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)setNavigationTitle:(NSString *)title
{
    self.mLabelTitle.text = title;
    self.navigationItem.titleView = self.mLabelTitle;
}


- (void)backItemAction
{
    for(int i = 0; i < self.view.subviews.count; i ++)
    {
        if([self.view.subviews[i] isKindOfClass:[UIScrollView class]])
        {
            UIScrollView *scrollView = (UIScrollView *)self.view.subviews[i];
            scrollView.delegate = nil;
        }
        else if( [self.view.subviews[i] isKindOfClass:[UITableView class]])
        {
            UITableView *tableView = (UITableView *)self.view.subviews[i];
            tableView.delegate = nil;
        }
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  MusicListVC.m
//  MusicDemo
//
//  Created by lly on 16/4/16.
//  Copyright © 2016年 lly. All rights reserved.
//

#import "MusicListVC.h"
#import "MusicListHeaderCell.h"
#import "MusicListCell.h"

@interface MusicListVC ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *mTableView;
@property (strong, nonatomic) NSMutableArray *dataSourceArray;
@end

@implementation MusicListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initUI];
    [self initData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - 初始化
- (void)initUI{

    [self setNavigationTitle:self.titleStr];
}

- (void)initData{

    
}

#pragma mark - 变量懒加载



#pragma mark - UITableViewDelegate


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return section == 0?1:_dataSourceArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0) {
        MusicListHeaderCell *headerCell = [tableView dequeueReusableCellWithIdentifier:@"MusicListHeaderCell"];
        
        return headerCell;
    }
    else{
    
        return nil;
    }
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

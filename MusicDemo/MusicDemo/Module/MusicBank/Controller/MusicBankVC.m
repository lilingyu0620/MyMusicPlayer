//
//  MusicBankVC.m
//  MusicDemo
//
//  Created by lly on 16/4/14.
//  Copyright © 2016年 lly. All rights reserved.
//

#import "MusicBankVC.h"
#import "MusicBankTypeModel.h"
#import "MusicBankTypeCell.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "NewCDVC.h"


typedef NS_ENUM(NSUInteger, MusicBankType) {
    NewCD = 0,//新歌首发
    Ranking,//排行
    Singer,//歌手
    Classification,//分类
    Listening,//大家在听
};

@interface MusicBankVC ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *mTableView;
@property (nonatomic, strong)NSMutableArray *typeArray;
@end

@implementation MusicBankVC

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



- (void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    
}
- (void)dealloc{

    self.mTableView.delegate = nil;
    self.mTableView.dataSource = nil;
}


#pragma mark - 初始化

- (void)initUI{
    
//    self.edgesForExtendedLayout = UIRectEdgeAll;
    [self.mTableView registerNib:[UINib nibWithNibName:@"MusicBankTypeCell" bundle:nil] forCellReuseIdentifier:@"MusicBankTypeCell"];
    self.mTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}


- (void)initData{

    self.mTableView.delegate = self;
    self.mTableView.dataSource = self;
    
    //从plist中读取列表数据
    [self loadTypesWithPlist];
}


- (void)loadTypesWithPlist{

    NSString *path = [[NSBundle mainBundle]pathForResource:@"musicType" ofType:@"plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    for (NSDictionary *dic in array) {
        MusicBankTypeModel *model = [MusicBankTypeModel modelWithDictionary:dic];
        [self.typeArray addObject:model];
    }
    [_mTableView reloadData];

}


//变量懒加载
- (NSMutableArray *)typeArray{

    if (!_typeArray) {
        _typeArray = [NSMutableArray array];
    }
    return _typeArray;
}



#pragma mark - UITableView DataSource 

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return _typeArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    MusicBankTypeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MusicBankTypeCell"];
    [cell setModel:_typeArray[indexPath.row]];
    return cell;
}


#pragma mark - UITableView Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

//    CGFloat height = [tableView fd_heightForCellWithIdentifier:@"MusicBankTypeCell" cacheByIndexPath:indexPath configuration:^(id cell) {
//        
//    }];
    return [MusicBankTypeCell cellHeight];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case NewCD:
        {
            NewCDVC *newCD = [[NewCDVC alloc]init];
            for (UIView * view in _mNaviagtionCon.navigationBar.subviews) {
                if (view.tag == 1001) {
                    view.hidden = YES;
                    break;
                }
            }
            [self.mNaviagtionCon pushViewController:newCD animated:YES];
        }
            break;
            
        default:
            break;
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

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
#import "MusicModel.h"
#import "NetWorkEngine.h"
#import "BottomPlayView.h"

@interface MusicListVC ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *mTableView;
@property (strong, nonatomic) NSMutableArray *dataSourceArray;
@property (nonatomic, strong) NSDictionary *headViewDic;
@end

@implementation MusicListVC
{
    NSIndexPath *_currentSelectedIndex;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initUI];
    [self initData];
    [self requestData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc{

    self.mTableView.delegate = nil;
    self.mTableView.dataSource = nil;
}
#pragma mark - 初始化
- (void)initUI{

    [self setNavigationTitle:self.titleStr];
    [_mTableView registerNib:[UINib nibWithNibName:@"MusicListCell" bundle:nil] forCellReuseIdentifier:@"MusicListCell"];
    [_mTableView registerNib:[UINib nibWithNibName:@"MusicListHeaderCell" bundle:nil] forCellReuseIdentifier:@"MusicListHeaderCell"];
    [self setExtraCellLineHidden:_mTableView];
    self.mTableView.contentInset = UIEdgeInsetsMake(0, 0, 160, 0);
    
    
    BottomPlayView *bpv = [BottomPlayView shareBottomPlayView];
    [self.view addSubview:bpv];
    [self.view bringSubviewToFront:bpv];
}

- (void)initData{
    self.mTableView.delegate = self;
    self.mTableView.dataSource = self;
    _currentSelectedIndex = nil;
    
}

//隐藏多余的分割线
- (void)setExtraCellLineHidden: (UITableView *)tableView
{
    
    UIView *view =[ [UIView alloc]init];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
}


#pragma mark - 变量懒加载
- (NSMutableArray *)dataSourceArray{

    if (!_dataSourceArray) {
        _dataSourceArray = [NSMutableArray array];
    }
    return _dataSourceArray;
}

- (NSDictionary *)headViewDic{

    if (!_headViewDic) {
        _headViewDic = [NSDictionary dictionary];
    }
    return _headViewDic;
}


#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0) {
        return [MusicListHeaderCell cellHeight];
    }
    else{
    
        return 74;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_currentSelectedIndex != indexPath) {
        _currentSelectedIndex = indexPath;
        BottomPlayView *bpv = [BottomPlayView shareBottomPlayView];
        MusicModel *model = self.dataSourceArray[indexPath.row];
        
        bpv.dataSourceArr = self.dataSourceArray;
        bpv.currentIndex = indexPath.row;
        
        [bpv setupPlayerWithModel:model];
    }

    
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return section == 0?1:_dataSourceArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0) {
        MusicListHeaderCell *headerCell = [tableView dequeueReusableCellWithIdentifier:@"MusicListHeaderCell"];
        [headerCell setModel:self.headViewDic];
        return headerCell;
    }
    else{
        MusicModel *model = _dataSourceArray[indexPath.row];
        MusicListCell *musicCell = [tableView dequeueReusableCellWithIdentifier:@"MusicListCell"];
        [musicCell setModel:model];
        return musicCell;
    }
}



#pragma mark - Private Method
- (void)requestData{

    NSString *url = [NSString stringWithFormat:@"http://api.songlist.ttpod.com/songlists/%@",self.msg_id];
    NSLog(@"====url = %@ =====",url);
    [NetWorkEngine jsonDataWithUrl:url andPara:nil andSuccess:^(id obj) {
        self.headViewDic = obj[@"owner"];
        NSLog(@"==== headDic = %@ ====",self.headViewDic);
        
        NSArray *array = obj[@"songs"];
        if ([array isKindOfClass:[NSArray class]]) {
            for (NSDictionary *dic in array) {
                MusicModel *model = [MusicModel modelWithDictionary:dic];
                [self.dataSourceArray addObject:model];
            }
            [_mTableView reloadData];
        }
        
    } andFail:^(id obj) {
        
    } andView:self.view];
    
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

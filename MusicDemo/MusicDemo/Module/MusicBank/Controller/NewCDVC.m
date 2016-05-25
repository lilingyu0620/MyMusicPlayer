//
//  NewCDVC.m
//  MusicDemo
//
//  Created by lly on 16/4/15.
//  Copyright © 2016年 lly. All rights reserved.
//

#import "NewCDVC.h"
#import "BaseVC.h"
#import "NetWorkEngine.h"
#import "NewCDModel.h"
#import "NewCDCell.h"
#import "MusicListVC.h"

@interface NewCDVC ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *mCollectionView;
@property (strong, nonatomic) NSMutableArray *dataSourceArray;
@end

@implementation NewCDVC

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


#pragma mark - 初始化
- (void)initUI{
    [self setNavigationTitle:@"新歌首发"];
    self.navigationController.navigationBar.hidden = NO;
}


- (void)initData{
    self.mCollectionView.delegate = self;
    self.mCollectionView.dataSource = self;
    
    [_mCollectionView registerNib:[UINib nibWithNibName:@"NewCDCell" bundle:nil] forCellWithReuseIdentifier:@"NewCDCell"];
}

#pragma mark - 变量懒加载
- (NSMutableArray *)dataSourceArray{

    if (!_dataSourceArray) {
        _dataSourceArray = [NSMutableArray array];
    }
    
    return _dataSourceArray;
}



#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return _dataSourceArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    NewCDCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"NewCDCell" forIndexPath:indexPath];
    [cell setModel:_dataSourceArray[indexPath.row]];
    return cell;
}


#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    NewCDModel *model = _dataSourceArray[indexPath.row];
    MusicListVC *listVC = [[MusicListVC alloc]init];
    listVC.titleStr = model.title;
    listVC.msg_id = model.msg_id;
    [self.navigationController pushViewController:listVC animated:YES];
    
}


#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{

    return CGSizeMake(kScreen_Width/2-10, kScreen_Width/2-10+42);
}


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(5, 5, 5, 5);
    
}

- (void)requestData{

    [NetWorkEngine jsonDataWithUrl:@"http://online.dongting.com/recomm/new_albums?page=1&size=30" andPara:nil andSuccess:^(id obj) {
        //
        NSArray *array = obj[@"data"];
        if ([array isKindOfClass:[NSArray class]]) {
            for (NSDictionary *dic in array) {
                NewCDModel *model = [NewCDModel modelWithDictionary:dic];
                [self.dataSourceArray addObject:model];
            }
            [_mCollectionView reloadData];
        }
    } andFail:^(id obj) {
        //
        UIImageView *imageBgk = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"network-disabled"]];
        imageBgk.center = CGPointMake(self.view.center.x, self.view.center.y - 50);
        [_mCollectionView addSubview:imageBgk];
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

//
//  MusicBankVC.m
//  MusicDemo
//
//  Created by lly on 16/4/14.
//  Copyright © 2016年 lly. All rights reserved.
//

#import "MusicBankVC.h"
#import "MusicBankTypeModel.h"

@interface MusicBankVC ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *mTableView;
@property (nonatomic, strong)NSMutableArray *typeArray;
@end

@implementation MusicBankVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initUI];
    [self initDate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - 初始化

- (void)initUI{
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
}


- (void)initDate{

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

    return 0;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    return nil;
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

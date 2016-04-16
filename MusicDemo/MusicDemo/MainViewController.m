//
//  MainViewController.m
//  MusicDemo
//
//  Created by lly on 16/4/14.
//  Copyright © 2016年 lly. All rights reserved.
//

#import "MainViewController.h"
#import "HotListenVC.h"
#import "MineVC.h"
#import "MusicBankVC.h"
#import "SearchVC.h"
#import "SwipeView.h"
#import "UINavigationController+FDFullscreenPopGesture.h"

typedef NS_ENUM(NSUInteger, NavigationBarTag) {
    MUSICBANK = 0,
    HOTLISTEN,
    SEARCH,
    MINE,
};

@interface MainViewController ()<SwipeViewDataSource,SwipeViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *mainNavigationBar;
//小红条
@property (weak, nonatomic) IBOutlet UIView *moveView;
//音库
@property (weak, nonatomic) IBOutlet UIButton *musicBankBtn;
//热听
@property (weak, nonatomic) IBOutlet UIButton *hotListenBtn;
//搜索
@property (weak, nonatomic) IBOutlet UIButton *searchBtn;
//我的
@property (weak, nonatomic) IBOutlet UIButton *mineBtn;

@property (weak, nonatomic) IBOutlet SwipeView *mySwipeView;
@property (nonatomic, strong) NSArray *btnArrays;
@property (nonatomic, strong) NSArray *viewArrays;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self fitView];
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

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated{

    [super viewWillDisappear:animated];
}
- (void)dealloc{

    self.mySwipeView.delegate = nil;
    self.mySwipeView.dataSource = nil;
}


#pragma mark - 初始化
//屏幕适配
- (void)fitView{
    
    [_mainNavigationBar setFrame:CGRectMake(_mainNavigationBar.frame.origin.x,20,kScreen_Width, _mainNavigationBar.frame.size.height)];
    
}

- (void)initUI{

    [self.view addSubview:self.mainNavigationBar];
    self.navigationController.navigationBar.hidden = YES;
    self.fd_prefersNavigationBarHidden = YES;
//    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
//    [self.navigationController.navigationBar addSubview:self.mainNavigationBar];

}
- (void)initData{

    self.mySwipeView.delegate = self;
    self.mySwipeView.dataSource = self;
    self.mySwipeView.wrapEnabled = YES;
    
    MusicBankVC *bankVC = [[MusicBankVC alloc]init];
    bankVC.mNaviagtionCon = self.navigationController;
    
    HotListenVC *hotVC = [[HotListenVC alloc]init];
    SearchVC *searchVC = [[SearchVC alloc]init];
    MineVC *mineVC = [[MineVC alloc]init];
    self.viewArrays = @[bankVC,hotVC,searchVC,mineVC];
    self.btnArrays = @[_musicBankBtn,_hotListenBtn,_searchBtn,_mineBtn];
    [self.mySwipeView reloadData];
    
}

//变量懒加载
- (NSArray *)viewArrays{

    if (!_viewArrays) {
        _viewArrays  = [NSArray array];
    }
    return _viewArrays;
}


- (NSArray *)btnArrays{

    if (!_btnArrays) {
        _btnArrays = [NSArray array];
    }
    return _btnArrays;
}


- (UIView *)mainNavigationBar{

    if (!_mainNavigationBar) {
        NSArray *array = [[NSBundle mainBundle]loadNibNamed:@"MainViewController" owner:self options:nil];
        _mainNavigationBar = [array lastObject];
    }
    
    return _mainNavigationBar;
}


- (IBAction)navigationBtnClick:(id)sender {
    
    UIButton *btn = (UIButton *)sender;
    [self updateMoveViewFrame:btn.tag];
    
    switch (btn.tag) {
        case MUSICBANK:
            self.mySwipeView.currentItemIndex = 0;
            break;
            
        case HOTLISTEN:
            self.mySwipeView.currentItemIndex = 1;
            break;
            
        case SEARCH:
            self.mySwipeView.currentItemIndex = 2;
            break;
            
        case MINE:
            self.mySwipeView.currentItemIndex = 3;
            break;
            
        default:
            break;
    }
}


- (void)updateMoveViewFrame:(NSInteger)index{

    UIButton *btn = self.btnArrays[index];
    [UIView  animateWithDuration:0.2 animations:^{
        self.moveView.centerX = btn.centerX;
    }];
}



#pragma mark - SwipeViewDateDelegate
- (NSInteger)numberOfItemsInSwipeView:(SwipeView *)swipeView{

    return _viewArrays.count;
}
- (UIView *)swipeView:(SwipeView *)swipeView viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{

    return [_viewArrays[index] view];
}


#pragma mark - SwipeViewDelegate
- (CGSize)swipeViewItemSize:(SwipeView *)swipeView
{
    return self.mySwipeView.bounds.size;
}


- (void)swipeViewDidEndDecelerating:(SwipeView *)swipeView{

    NSLog(@"======%ld=======",(long)swipeView.currentItemIndex);
    [self updateMoveViewFrame:swipeView.currentItemIndex];

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

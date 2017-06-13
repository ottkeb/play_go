//
//  MainDataViewController.m
//  play_go
//
//  Created by xuwj on 16/7/26.
//  Copyright © 2016年 风影. All rights reserved.
//

#import "MainDataViewController.h"
#import "LineProgressView.h"

@interface MainDataViewController()<UICollectionViewDelegate,UICollectionViewDataSource>
{
    UICollectionView *_dialCollectionView;
    UICollectionViewCell *_dialCell;
    NSIndexPath     *selectIndexPath;
}

@property (nonatomic,strong) CWRefreshTableView *cwRefreshTable;

@end

@implementation MainDataViewController

- (instancetype)init
{
    self= [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"今天";
    [self initCollectionView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.translucent = NO;
}


- (void)initCollectionView
{
    CGSize itemSize = CGSizeMake(KWidth, KWidth-64);
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.itemSize = itemSize;
    layout.minimumInteritemSpacing=0;
    layout.minimumLineSpacing=0;
    _dialCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, KWidth, KWidth-44) collectionViewLayout:layout];
    [_dialCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
    _dialCollectionView.dataSource=self;
    
    _dialCollectionView.tag=300;
    _dialCollectionView.layer.borderWidth = 0;
    _dialCollectionView.backgroundColor=kNavBgColor;
    _dialCollectionView.delegate=self;
    _dialCollectionView.contentSize=CGSizeMake(-KWidth*30, 235.0+50);
    _dialCollectionView.bounces=NO;
    _dialCollectionView.pagingEnabled = YES;
    _dialCollectionView.showsHorizontalScrollIndicator=NO;
    _dialCollectionView.hidden=NO;
    _dialCollectionView.contentOffset = CGPointMake(KWidth*30,0);
    _dialCollectionView.scrollEnabled = YES;
    
   _dialCollectionView.prefetchingEnabled = NO; //是否开启预加载
    
    [self.view addSubview:_dialCollectionView];
    
    
//    //刷新控件
//    if (_cwRefreshTable == nil) {
//        _cwRefreshTable = [CWRefreshTableView alloc]initWithTableView:<#(UITableView *)#> pullDirection:<#(CWRefreshTableViewDirection)#> isNewSportVC:<#(NSString *)#>;
//    }
//
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 30;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifierCell = @"Cell";
    selectIndexPath = indexPath;
    _dialCell= (UICollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:identifierCell forIndexPath:indexPath];
    
    _dialCell.backgroundColor=kNavBgColor;
    
    [self addDial];
    
    return _dialCell;
}


- (void)addDial
{
    LineProgressView *progressView = [[LineProgressView alloc] initWithFrame:_dialCell.bounds];
    progressView.backgroundColor = kNavBgColor;
    progressView.total = 54;
    progressView.color = RGB(0, 124, 188);
    progressView.radius = 105;
    progressView.innerRadius = 93;
    progressView.startAngle = M_PI * 0.72;
    progressView.endAngle = M_PI * 2.28;
    progressView.animationDuration = 2;
    progressView.layer.shouldRasterize = YES;
    [_dialCell addSubview:progressView];
    [progressView setCompleted:progressView.total animated:YES];
    
}

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.item != selectIndexPath.item) {
        [self changeWalkDate:selectIndexPath.item];
    }
}


- (void)changeWalkDate:(NSInteger)index
{
    index = (index <= 30-1) ? index : 30-1;

    NSTimeInterval second = 24 * 60 * 60 * (29-index);
    NSDate *date = [[NSDate alloc] initWithTimeIntervalSinceNow:-second];
    //格式化日期类
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"MM月dd日"];
    //将日期按照格式化类型转换成字符串
    if (index == 29) {
        [self setTitle:@"今天"];
    }
    else{
        
    [self setTitle: [df stringFromDate:date]];
        
    }
}


@end

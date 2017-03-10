//
//  LiuHomeViewController.m
//  网易新闻
//
//  Created by 刘晓晨 on 2017/3/10.
//  Copyright © 2017年 刘晓晨. All rights reserved.
//

#import "LiuHomeViewController.h"
#import "LiuSourceDataModel.h"
#import "LiuSysAddition.h"
#import "LiuNewsCollectionViewCell.h"
@interface LiuHomeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

/**
 频道栏scrollview
 */
@property (weak, nonatomic) IBOutlet UIScrollView *channelScrollView;

/**
 详细新闻栏
 */
@property (weak, nonatomic) IBOutlet UICollectionView *newsCollectionView;

/**
 布局对象
 */
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;


/**
 数据源
 */
@property(nonatomic,strong)NSArray *dataArray;

@end

@implementation LiuHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //不要系统自适应navigationbar
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor redColor];
    [self loadData];
    [self loadchannelScrollView];
    [self loadNewsCollectionView];
}

#pragma mark - 加载数据
-(void)loadData {
    
    NSArray *dataArray = [LiuSourceDataModel analysisDataWithJSONName:@"topic_news.json"];
    
    self.dataArray = dataArray;
   
}

#pragma mark - 设置频道栏label
-(void)loadchannelScrollView {
    
    //去掉频道栏的滚动条和弹簧效果
    self.channelScrollView.showsVerticalScrollIndicator = NO;
    self.channelScrollView.showsHorizontalScrollIndicator = NO;
    self.channelScrollView.bounces = NO;
    
    //根据数据源创建label放到scrollview上
    CGFloat labelW = 70;
    CGFloat labelH = 44;
    for (int i = 0;i<self.dataArray.count;i++)
    {
        LiuSourceDataModel *model = self.dataArray[i];
        UILabel *label = [UILabel liu_labelWithTextFontSize:15 andTextColor:[UIColor darkGrayColor] andText:model.tname];
        label.frame = CGRectMake(i * labelW, 0, labelW, labelH);
        label.textAlignment = NSTextAlignmentCenter;
        [self.channelScrollView addSubview:label];
    }
    
    //设置滚动范围
    self.channelScrollView.contentSize = CGSizeMake(labelW * self.dataArray.count, 0);
}

#pragma mark - 设置新闻栏

-(void)loadNewsCollectionView {
    
    //设置布局对象layout
    self.flowLayout.itemSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height - 64 - 44);
    self.flowLayout.minimumLineSpacing = 0;
    self.flowLayout.minimumInteritemSpacing = 0;
    self.flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    //设置数据源和代理
    self.newsCollectionView.dataSource = self;
    self.newsCollectionView.delegate = self;
    
    //取消滚动条和弹簧效果
    self.newsCollectionView.showsHorizontalScrollIndicator = NO;
    self.newsCollectionView.showsVerticalScrollIndicator = NO;
    self.newsCollectionView.bounces = NO;
    
    //设置分页效果
    self.newsCollectionView.pagingEnabled = YES;
}

#pragma mark - 数据源,代理方法
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LiuNewsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    
    LiuSourceDataModel *model = self.dataArray[indexPath.item];
    
    cell.tid =model.tid;
    
    return cell;
}















@end

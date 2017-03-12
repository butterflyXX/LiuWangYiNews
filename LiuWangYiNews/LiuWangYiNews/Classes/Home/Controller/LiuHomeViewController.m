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
@property (weak, nonatomic) IBOutlet UIView *leftShadowView;
@property (weak, nonatomic) IBOutlet UIView *rightShadowView;


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
    
    //初始化两个掩体view
    [self createleftShadowView];
    [self createrightShadowView];
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
    CGFloat labelW = 80;
    CGFloat labelH = 44;
    for (int i = 0;i<self.dataArray.count;i++)
    {
        LiuSourceDataModel *model = self.dataArray[i];
        UILabel *label = [UILabel liu_labelWithTextFontSize:15 andTextColor:[UIColor blackColor] andText:model.tname];
        label.frame = CGRectMake(i * labelW, 0, labelW, labelH);
        label.textAlignment = NSTextAlignmentCenter;
        label.tag = i;
        
        //开启label的用户交互功能
        label.userInteractionEnabled = YES;
        
        //设置手势方法
        UITapGestureRecognizer *topRecgnizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(buttonAction:)];
        [label addGestureRecognizer:topRecgnizer];
        
        if (i == 0) {
            label.textColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:1];
            label.transform = CGAffineTransformMakeScale(1.3, 1.3);
        }
        
        [self.channelScrollView addSubview:label];
    }
    
    //设置滚动范围
    self.channelScrollView.contentSize = CGSizeMake(labelW * self.dataArray.count, 0);
}

#pragma mark - label的点击事件
-(void)buttonAction:(UITapGestureRecognizer *)sender {
    
    CGPoint offset = CGPointMake(sender.view.center.x - self.view.bounds.size.width / 2, 0);
    
    offset = [self offsetWithOffset:offset];
    
    //点击label到中间显示
    [self.channelScrollView setContentOffset:offset animated:YES];
    
    //点击label跳转news栏
    UILabel *label = (UILabel *)sender.view;
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:label.tag inSection:0];
    
    [self.newsCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    for (UILabel *sublabel in self.channelScrollView.subviews) {
        sublabel.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
        sublabel.transform = CGAffineTransformMakeScale(1, 1);
    }
    label.textColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:1];
    label.transform = CGAffineTransformMakeScale(1.3, 1.3);
    
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

//滚动collectionview的代理方法,改变label属性
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (scrollView.tracking == 0 && scrollView.dragging == 0 && scrollView.decelerating == 0) {
        return;
    }
    NSInteger index = scrollView.contentOffset.x / self.view.bounds.size.width;
    float percent = scrollView.contentOffset.x / self.view.bounds.size.width - index;
    
    //获取对应的label//对应的label状态改变
    UILabel *lastLabel = self.channelScrollView.subviews[index];
    lastLabel.textColor = [UIColor colorWithRed:1 - percent green:0 blue:0 alpha:1];
    lastLabel.transform = CGAffineTransformMakeScale(1 + (1 - percent) * 0.3, 1 + (1 - percent) * 0.3);
    if (index + 1 <self.dataArray.count) {
        UILabel *nextLabel = self.channelScrollView.subviews[index + 1];
        nextLabel.textColor = [UIColor colorWithRed:percent green:0 blue:0 alpha:1];
        nextLabel.transform = CGAffineTransformMakeScale(1 + percent * 0.3, 1 + percent * 0.3);
    }
    
    
    
}

//显示对应的label到中间
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    float percent = scrollView.contentOffset.x / self.view.bounds.size.width;
    
    //滚动到的位置
    CGPoint point = CGPointMake(percent * 80  + 0.5 * 80 - self.view.bounds.size.width  / 2, 0);
    
    point = [self offsetWithOffset:point];
    [self.channelScrollView setContentOffset:point animated:YES];
}

#pragma mark - 确定offset位置
-(CGPoint)offsetWithOffset:(CGPoint)offset {
    //判断offset范围
    if (offset.x > self.channelScrollView.contentSize.width - self.view.bounds.size.width) {
        offset = CGPointMake(self.channelScrollView.contentSize.width - self.view.bounds.size.width, 0);
    }
    else if (offset.x < 0) {
        offset = CGPointMake(0, 0);
    }
    return offset;
}



//创建渐变视图
- (void)createleftShadowView{
    
    
//    self.leftShadowView.backgroundColor = [UIColor whiteColor];
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.leftShadowView.bounds;
    //设置渐变颜色数组,可以加透明度的渐变
    gradientLayer.colors = @[(__bridge id)[UIColor colorWithWhite:0 alpha:0].CGColor,(__bridge id)[UIColor colorWithWhite:0 alpha:1].CGColor];
    //设置渐变区域的起始和终止位置（范围为0-1）
    gradientLayer.startPoint = CGPointMake(1, 0);
    gradientLayer.endPoint = CGPointMake(0, 0);
    //gradientLayer.locations = @[@(0.8f)];//设置渐变位置数组
    //注意：这里不用下边的这句话
    //[gradientView.layer addSublayer:gradientLayer];//将CAGradientlayer对象添加在我们要设置背景色的视图的layer层
    //设置蒙版，用来改变layer的透明度
    [self.leftShadowView.layer setMask:gradientLayer];
}

- (void)createrightShadowView{
    
    
    //    self.leftShadowView.backgroundColor = [UIColor whiteColor];
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.rightShadowView.bounds;
    //设置渐变颜色数组,可以加透明度的渐变
    gradientLayer.colors = @[(__bridge id)[UIColor colorWithWhite:0 alpha:0].CGColor,(__bridge id)[UIColor colorWithWhite:0 alpha:1].CGColor];
    //设置渐变区域的起始和终止位置（范围为0-1）
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1, 0);
    //gradientLayer.locations = @[@(0.8f)];//设置渐变位置数组
    //注意：这里不用下边的这句话
    //[gradientView.layer addSublayer:gradientLayer];//将CAGradientlayer对象添加在我们要设置背景色的视图的layer层
    //设置蒙版，用来改变layer的透明度
    [self.rightShadowView.layer setMask:gradientLayer];
}











@end

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
@interface LiuHomeViewController ()

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
    [self loadData];
    [self loadchannelScrollView];
}


-(void)loadData {
    
    NSArray *dataArray = [LiuSourceDataModel analysisDataWithJSONName:@"topic_news.json"];
    
    self.dataArray = dataArray;
   
}

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













@end

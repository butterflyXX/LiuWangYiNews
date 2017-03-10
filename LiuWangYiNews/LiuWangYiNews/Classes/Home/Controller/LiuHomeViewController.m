//
//  LiuHomeViewController.m
//  网易新闻
//
//  Created by 刘晓晨 on 2017/3/10.
//  Copyright © 2017年 刘晓晨. All rights reserved.
//

#import "LiuHomeViewController.h"
#import "LiuSourceDataModel.h"
@interface LiuHomeViewController ()

/**
 频道栏scrollview
 */
@property (weak, nonatomic) IBOutlet UIScrollView *channelScrollView;

/**
 详细新闻栏
 */
@property (weak, nonatomic) IBOutlet UICollectionView *newsCollectionView;

@end

@implementation LiuHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
}


-(void)loadData {
    
    NSArray *dataArray = [LiuSourceDataModel analysisDataWithJSONName:@"topic_news.json"];
    NSLog(@"%@",dataArray);
   
}












@end

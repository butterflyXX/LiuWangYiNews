//
//  LiuNewsTableView.m
//  LiuWangYiNews
//
//  Created by 刘晓晨 on 2017/3/10.
//  Copyright © 2017年 刘晓晨. All rights reserved.
//

#import "LiuNewsTableView.h"

@interface LiuNewsTableView ()


@end

@implementation LiuNewsTableView

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        //添加一个下拉刷新
        UIRefreshControl *fresh=[[UIRefreshControl alloc]init];
        [fresh addTarget:self action:@selector(freshAction:) forControlEvents:UIControlEventValueChanged];
        fresh.attributedTitle=[[NSMutableAttributedString alloc]initWithString:@"下拉刷新"];
        self.refreshControl=fresh;
    }
    return self;
    
}


-(void)freshAction:(UIRefreshControl*)aRefresh
{
    self.refreshControl.attributedTitle=[[NSMutableAttributedString alloc]initWithString:@"加载中..."];
    if ([self.delegate respondsToSelector:@selector(liuNewsTableViewRefresh)]) {
        
        [self.refreshDelegate liuNewsTableViewRefresh];
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [aRefresh endRefreshing];
        aRefresh.attributedTitle=[[NSMutableAttributedString alloc]initWithString:@"下拉刷新"];
    });
    
}

@end

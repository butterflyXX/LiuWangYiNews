//
//  LiuNewsCollectionViewCell.m
//  LiuWangYiNews
//
//  Created by 刘晓晨 on 2017/3/10.
//  Copyright © 2017年 刘晓晨. All rights reserved.
//

#import "LiuNewsCollectionViewCell.h"
#import "LiuNewsTableView.h"

@interface LiuNewsCollectionViewCell ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,weak)LiuNewsTableView *tableView;

@end
static NSString *cellID = @"cellID";
@implementation LiuNewsCollectionViewCell

-(void)awakeFromNib {
    [super awakeFromNib];
    
    
    //创建tableView
    LiuNewsTableView *tableView = [LiuNewsTableView new];
    tableView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1];
    [self.contentView addSubview:tableView];
    self.tableView = tableView;
    
    //设置数据源代理
    tableView.delegate = self;
    tableView.dataSource = self;
    
    //注册cell
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
}

-(void)layoutSubviews {
    [super layoutSubviews];
    self.tableView.frame = self.contentView.bounds;
}

#pragma mark - 数据源和代理方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%zd",indexPath.row];
    return cell;
}

#pragma mark - 重写settid方法
-(void)setTid:(NSString *)tid {
    _tid = tid;
    
    //获取网络数据
    [self.tableView reloadData];
}

@end

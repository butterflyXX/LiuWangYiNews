//
//  LiuNewsCollectionViewCell.m
//  LiuWangYiNews
//
//  Created by 刘晓晨 on 2017/3/10.
//  Copyright © 2017年 刘晓晨. All rights reserved.
//

#import "LiuNewsCollectionViewCell.h"
#import "LiuNewsTableView.h"
#import "LiuNetworkingManager.h"
#import "LiuNewsModel.h"
@interface LiuNewsCollectionViewCell ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,weak)LiuNewsTableView *tableView;

@property(nonatomic,strong)NSArray *dataArray;

@end
static NSString *cellID = @"cellID";
@implementation LiuNewsCollectionViewCell

-(void)awakeFromNib {
    [super awakeFromNib];
    
    
    //创建tableView
    LiuNewsTableView *tableView = [LiuNewsTableView new];
    tableView.backgroundColor = [UIColor whiteColor];
//    tableView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1];
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
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    LiuNewsModel *model = self.dataArray[indexPath.row];
    cell.textLabel.text = model.title;
    return cell;
}

#pragma mark - 重写settid方法
-(void)setTid:(NSString *)tid {
    _tid = tid;
    
    //获取网络数据
    [[LiuNetworkingManager sharedManger] requestWithType:GET andURLString:[NSString stringWithFormat:@"%@/0-20.html",tid] andParameters:nil andCompleteBlock:^(id responseObject) {
        [self loadDataWithResponseObject:responseObject];
    }];
}

-(void)loadDataWithResponseObject:(id)responseObject {
    NSArray *dataArray = ((NSDictionary *)responseObject).allValues.firstObject;
    self.dataArray = [LiuNewsModel analysisDataWithArray:dataArray];
    [self.tableView reloadData];
}

@end















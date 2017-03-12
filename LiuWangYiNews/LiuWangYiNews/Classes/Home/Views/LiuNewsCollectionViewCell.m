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
#import "LiuNewsTableViewCell.h"
@interface LiuNewsCollectionViewCell ()<UITableViewDelegate,UITableViewDataSource,LiuNewsTableViewDelegate>

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
    tableView.refreshDelegate = self;
    
    //注册cell
    [tableView registerNib:[UINib nibWithNibName:@"LiuNewsCommonCell" bundle:nil] forCellReuseIdentifier:@"commonCell"];
    [tableView registerNib:[UINib nibWithNibName:@"LiuNewsBigImageCell" bundle:nil] forCellReuseIdentifier:@"bigImageCell"];
    [tableView registerNib:[UINib nibWithNibName:@"LiuNewsImagesCell" bundle:nil] forCellReuseIdentifier:@"imagesCell"];
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
    LiuNewsModel *model = self.dataArray[indexPath.row];
    LiuNewsTableViewCell *cell;
    if (model.imgType) {
        cell= [tableView dequeueReusableCellWithIdentifier:@"bigImageCell" forIndexPath:indexPath];
    }
    else if (model.imgextra.count){
        cell= [tableView dequeueReusableCellWithIdentifier:@"imagesCell" forIndexPath:indexPath];
    }
    else {
        cell= [tableView dequeueReusableCellWithIdentifier:@"commonCell" forIndexPath:indexPath];
    }
    
    
    cell.cellModel = model;
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

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    LiuNewsModel *model = self.dataArray[indexPath.row];
    if (model.imgType) {
        return 130;
    }
    else if (model.imgextra.count == 2) {
        return 180;
    }
    return 80;
}
#pragma mark - 刷新数据
-(void)liuNewsTableViewRefresh {
    
    //获取网络数据
    [[LiuNetworkingManager sharedManger] requestWithType:GET andURLString:[NSString stringWithFormat:@"%@/0-20.html",self.tid] andParameters:nil andCompleteBlock:^(id responseObject) {
        [self loadDataWithResponseObject:responseObject];
    }];
}
@end















//
//  LiuSourceDataModel.m
//  LiuWangYiNews
//
//  Created by 刘晓晨 on 2017/3/10.
//  Copyright © 2017年 刘晓晨. All rights reserved.
//

#import "LiuSourceDataModel.h"
#import <YYModel.h>
@implementation LiuSourceDataModel

-(NSString *)description {
    return [NSString stringWithFormat:@"%@-%@",self.tid,self.tname];
}

+(NSArray *)analysisDataWithJSONName:(NSString *)jsonName {
    
    //获取本地json数据地址nsData
    NSURL *dataUrl = [[NSBundle mainBundle] URLForResource:jsonName withExtension:nil];
    
    //转化成data
    NSData *data = [NSData dataWithContentsOfURL:dataUrl];
    
    //转换成dict
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
    
    NSArray *dataArray = [dict objectForKey:@"tList"];
    
    dataArray = [NSArray yy_modelArrayWithClass:[self class] json:dataArray];
    
    //根据tid排序
    dataArray = [dataArray sortedArrayUsingComparator:^NSComparisonResult(LiuSourceDataModel *obj1,LiuSourceDataModel *obj2) {
        return [obj1.tid compare:obj2.tid];
    }];
    
    //返回
    return dataArray;
    
}

@end

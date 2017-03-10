//
//  LiuNewsModel.m
//  LiuWangYiNews
//
//  Created by 刘晓晨 on 2017/3/10.
//  Copyright © 2017年 刘晓晨. All rights reserved.
//

#import "LiuNewsModel.h"
#import <YYModel.h>
@implementation LiuNewsModel
+(NSArray *)analysisDataWithArray:(NSArray *)array {
    
    NSArray *dataArray = [NSArray yy_modelArrayWithClass:[self class] json:array];
    return dataArray;
}
@end

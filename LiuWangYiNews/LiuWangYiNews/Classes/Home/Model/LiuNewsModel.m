//
//  LiuNewsModel.m
//  LiuWangYiNews
//
//  Created by 刘晓晨 on 2017/3/10.
//  Copyright © 2017年 刘晓晨. All rights reserved.
//

#import "LiuNewsModel.h"
#import <YYModel.h>
#import "LiuNewsImagesModel.h"
@implementation LiuNewsModel

//  模型容器属性(NSArray,NSSet)指定对应的class
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"imgextra" : [LiuNewsImagesModel class]};
}
+(NSArray *)analysisDataWithArray:(NSArray *)array {
//     NSLog(@"%@ -- %@",[NSThread currentThread],array[0]);
    
    
    NSArray *dataArray = [NSArray yy_modelArrayWithClass:[self class] json:array];
    return dataArray;
}
@end

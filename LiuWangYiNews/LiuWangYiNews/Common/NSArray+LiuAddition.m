//
//  NSArray+LiuAddition.m
//  支付宝(练习2)
//
//  Created by 刘晓晨 on 2017/1/12.
//  Copyright © 2017年 刘晓晨. All rights reserved.
//

#import "NSArray+LiuAddition.h"
#import "NSObject+LiuAddition.h"
@implementation NSArray (LiuAddition)
+ (NSArray *)liu_objectListWithPlistName:(NSString *)plistName clsName:(NSString *)clsName {
    NSURL *url = [[NSBundle mainBundle] URLForResource:plistName withExtension:nil];
    NSArray *list = [NSArray arrayWithContentsOfURL:url];
    
    NSMutableArray *arrayM = [NSMutableArray array];
    
    Class Clz = NSClassFromString(clsName);
    NSAssert(Clz, @"加载 plist 文件时指定的 clsName - %@ 错误", clsName);
    
    for (NSDictionary *dict in list) {
        [arrayM addObject:[Clz liu_objectWithDict:dict]];
    }
    
    return arrayM.copy;
}
@end

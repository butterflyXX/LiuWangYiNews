//
//  NSObject+LiuAddition.h
//  支付宝(练习2)
//
//  Created by 刘晓晨 on 2017/1/12.
//  Copyright © 2017年 刘晓晨. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (LiuAddition)


/// 使用字典创建模型对象
///
/// @param dict 字典
///
/// @return 模型对象
+ (instancetype)liu_objectWithDict:(NSDictionary *)dict;

@end

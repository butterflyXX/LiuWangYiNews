//
//  NSArray+LiuAddition.h
//  支付宝(练习2)
//
//  Created by 刘晓晨 on 2017/1/12.
//  Copyright © 2017年 刘晓晨. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (LiuAddition)
/// 从 plist 文件创建指定 clsName 对象数组
///
/// @param plistName plist 文件名
/// @param clsName   要创建模型的类名
///
/// @return clsName 的对象数组
+ (NSArray *)liu_objectListWithPlistName:(NSString *)plistName clsName:(NSString *)clsName;
@end

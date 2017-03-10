//
//  NSArray+reDescriptionAddition.m
//  1.XMLtoModel
//
//  Created by 刘晓晨 on 2017/3/3.
//  Copyright © 2017年 刘晓晨. All rights reserved.
//

#import "NSArray+reDescriptionAddition.h"

@implementation NSArray (reDescriptionAddition)

//  在使用nslog打印这个对象的时候会调用
- (NSString *)descriptionWithLocale:(id)locale {
    
    NSMutableString *strM = [NSMutableString string];
    
    [strM appendString:@"(\n"];
    
    //  遍历数组,完成字符串的拼接
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        //  判断是否是最后一个元素
        if (idx == self.count - 1) {
            [strM appendFormat:@"\t%@\n", obj];
        } else {
            [strM appendFormat:@"\t%@,\n", obj];
        }
        
    }];
    
    
    [strM appendString:@")\n"];
    
    return strM;
    
    
}


@end


@implementation NSDictionary (reDescriptionAddition)

- (NSString *)descriptionWithLocale:(id)locale {
    NSMutableString *strM = [NSMutableString string];
    
    [strM appendString:@"{\n"];
    
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        [strM appendFormat:@"\t%@ = %@;\n", key, obj];
        
    }];
    
    [strM appendString:@"}\n"];
    
    return strM;
}

@end

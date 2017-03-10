//
//  UIColor+LiuAdditon.m
//  生活圈
//
//  Created by 刘晓晨 on 2017/1/5.
//  Copyright © 2017年 刘晓晨. All rights reserved.
//

#import "UIColor+LiuAdditon.h"

@implementation UIColor (LiuAdditon)
+ (instancetype)themeColor {
    return [self liu_colorWithHex:0x6c7ea2];
}

/**
 * 将传入的16进制数值，转换成对应的颜色 最大颜色数值 0xFFFFFF F => 1111
 *
 * @param hex hex，例如 0xFF0000 红色
 *
 * @return UIColor
 */
+ (instancetype)liu_colorWithHex:(uint32_t)hex {
    // 0xFEABCC & 0xFF0000 => 0xFE0000 >> 16 => FE
    int r = (hex & 0xFF0000) >> 16;
    // 0xFEABCC & 0x00FF00 =>  0x00AB00 >> 8 => AB
    int g = (hex & 0x00FF00) >> 8;
    // 0xFEABCC & 0x0000FF =>  0x0000CC
    int b = hex & 0x0000FF;
    
    // 创建颜色
    return [self colorWithRed:r green:g blue:b];
}

+ (instancetype)colorWithRed:(int)red green:(int)green blue:(int)blue {
    return [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:1.0];
}
@end

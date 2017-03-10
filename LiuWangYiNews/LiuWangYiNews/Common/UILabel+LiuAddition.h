//
//  UILabel+LiuAddition.h
//  口碑
//
//  Created by 刘晓晨 on 2017/1/5.
//  Copyright © 2017年 刘晓晨. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (LiuAddition)
+(instancetype)liu_labelWithTextFontSize:(CGFloat)size andTextColor:(UIColor *)color andText:(NSString *)text;
-(instancetype)initWithTextFontSize:(CGFloat)size andTextColor:(UIColor *)color andText:(NSString *)text;
@end

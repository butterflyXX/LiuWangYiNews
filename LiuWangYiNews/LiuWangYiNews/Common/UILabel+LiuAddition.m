//
//  UILabel+LiuAddition.m
//  口碑
//
//  Created by 刘晓晨 on 2017/1/5.
//  Copyright © 2017年 刘晓晨. All rights reserved.
//

#import "UILabel+LiuAddition.h"

@implementation UILabel (LiuAddition)

-(instancetype)initWithTextFontSize:(CGFloat)size andTextColor:(UIColor *)color andText:(NSString *)text {
        if (self = [super init])
        {
            self.font = [UIFont systemFontOfSize:size];
            self.textColor = color;
            self.text = text;
        }
        return self;
}
+(instancetype)liu_labelWithTextFontSize:(CGFloat)size andTextColor:(UIColor *)color andText:(NSString *)text {
    UILabel *label = [[UILabel alloc] initWithTextFontSize:size andTextColor:color andText:text];
    return label;
}

@end

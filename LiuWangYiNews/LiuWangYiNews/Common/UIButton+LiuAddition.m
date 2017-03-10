//
//  UIButton+LiuAddition.m
//  生活圈
//
//  Created by 刘晓晨 on 2017/1/5.
//  Copyright © 2017年 刘晓晨. All rights reserved.
//

#import "UIButton+LiuAddition.h"
#import "UIColor+LiuAdditon.h"
@implementation UIButton (LiuAddition)
+(instancetype)liu_buttonWithFontSize:(CGFloat)size andColorWithHex:(uint32_t)color andTitle:(NSString *)title {
    UIButton *button = [UIButton new];
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:12];
    [button setTitleColor:[UIColor liu_colorWithHex:0x6c7ea2] forState:UIControlStateNormal];
    return button;
}
+(instancetype)liu_buttonWithNormalImagenamed:(NSString *)normalimagename andHighlightedImagenamed:(NSString *)highlightedimagename {
    UIButton *button = [UIButton new];
    [button setImage:[UIImage imageNamed:normalimagename] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highlightedimagename] forState:UIControlStateHighlighted];
    return button;
}
@end

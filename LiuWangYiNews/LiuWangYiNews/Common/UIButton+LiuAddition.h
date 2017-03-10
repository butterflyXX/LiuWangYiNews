//
//  UIButton+LiuAddition.h
//  生活圈
//
//  Created by 刘晓晨 on 2017/1/5.
//  Copyright © 2017年 刘晓晨. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (LiuAddition)
+(instancetype)liu_buttonWithFontSize:(CGFloat)size andColorWithHex:(uint32_t)color andTitle:(NSString *)title;
+(instancetype)liu_buttonWithNormalImagenamed:(NSString *)imagename andHighlightedImagenamed:(NSString *)imagename;
@end

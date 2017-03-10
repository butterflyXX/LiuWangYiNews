//
//  UIViewController+LiuAddition.h
//  Meituan
//
//  Created by 刘晓晨 on 2017/2/10.
//  Copyright © 2017年 刘晓晨. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (LiuAddition)
- (void)liu_addChildController:(UIViewController *)childController intoView:(UIView *)view;
@end

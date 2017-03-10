//
//  UIViewController+LiuAddition.m
//  Meituan
//
//  Created by 刘晓晨 on 2017/2/10.
//  Copyright © 2017年 刘晓晨. All rights reserved.
//

#import "UIViewController+LiuAddition.h"

@implementation UIViewController (LiuAddition)
- (void)liu_addChildController:(UIViewController *)childController intoView:(UIView *)view  {
    
    // 1> 添加子控制器 － 否则响应者链条会被打断，导致事件无法正常传递，而且错误非常难改！
    [self addChildViewController:childController];
    
    // 2> 添加子控制器的视图
    [view addSubview:childController.view];
    
    // 3> 完成子控制器的添加
    [childController didMoveToParentViewController:self];
}
@end

//
//  LiuNewsTableView.h
//  LiuWangYiNews
//
//  Created by 刘晓晨 on 2017/3/10.
//  Copyright © 2017年 刘晓晨. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LiuNewsTableView;

@protocol LiuNewsTableViewDelegate <NSObject>

-(void)liuNewsTableViewRefresh;

@end

@interface LiuNewsTableView : UITableView

@property(nonatomic,weak)id<LiuNewsTableViewDelegate> refreshDelegate;
@end

//
//  LiuNewsModel.h
//  LiuWangYiNews
//
//  Created by 刘晓晨 on 2017/3/10.
//  Copyright © 2017年 刘晓晨. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LiuNewsModel : NSObject
//title = 韩代总统就朴槿惠遭弹劾发表国民讲话;
@property(nonatomic,copy)NSString *title;
+(NSArray *)analysisDataWithArray:(NSArray *)array;

@end

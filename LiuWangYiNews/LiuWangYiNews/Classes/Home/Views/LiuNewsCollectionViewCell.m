//
//  LiuNewsCollectionViewCell.m
//  LiuWangYiNews
//
//  Created by 刘晓晨 on 2017/3/10.
//  Copyright © 2017年 刘晓晨. All rights reserved.
//

#import "LiuNewsCollectionViewCell.h"

@implementation LiuNewsCollectionViewCell

-(void)awakeFromNib {
    [super awakeFromNib];
    self.contentView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1];
}

@end

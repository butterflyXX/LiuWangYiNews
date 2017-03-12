//
//  LiuNewsTableViewCell.m
//  LiuWangYiNews
//
//  Created by 刘晓晨 on 2017/3/11.
//  Copyright © 2017年 刘晓晨. All rights reserved.
//

#import "LiuNewsTableViewCell.h"
#import <UIImageView+WebCache.h>
@interface LiuNewsTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imgsrcImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *sourceLabel;
@property (weak, nonatomic) IBOutlet UILabel *replyCountLabel;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *imagesArray;

/*

@property(nonatomic,copy)NSString *title;


@property(nonatomic,strong)NSNumber *replyCount;


@property(nonatomic,strong)NSString *source;


@property(nonatomic,strong)NSString *imgsrc;


@property(nonatomic,strong)NSArray *imgextra;


@property (nonatomic, assign) BOOL imgType;
 */

@end

@implementation LiuNewsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

-(void)setCellModel:(LiuNewsModel *)cellModel {
    _cellModel = cellModel;
    if (cellModel.imgextra.count) {
        
        for (int i = 0;i<self.imagesArray.count;i++)
        {
            LiuNewsImagesModel *imagesModel = cellModel.imgextra[i];
            [self.imagesArray[i] sd_setImageWithURL:[NSURL URLWithString:imagesModel.imgsrc] placeholderImage:[UIImage imageNamed:@"placeholderImage"]];
        }
    }
    [self.imgsrcImageView sd_setImageWithURL:[NSURL URLWithString:cellModel.imgsrc] placeholderImage:[UIImage imageNamed:@"placeholderImage"]];
    self.titleLabel.text = cellModel.title;
    self.sourceLabel.text = cellModel.source;
    self.replyCountLabel.text = cellModel.replyCount.description;
}

@end









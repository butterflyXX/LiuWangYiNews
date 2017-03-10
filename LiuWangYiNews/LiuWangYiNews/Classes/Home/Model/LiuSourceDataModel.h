//
//  LiuSourceDataModel.h
//  LiuWangYiNews
//
//  Created by 刘晓晨 on 2017/3/10.
//  Copyright © 2017年 刘晓晨. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LiuSourceDataModel : NSObject

@property(nonatomic,copy)NSString *tid;

@property(nonatomic,copy)NSString *tname;

+(NSArray *)analysisDataWithJSONName:(NSString *)jsonName;
//{
//    tList = (
//             {
//                 tname = 原创;
//                 color = ;
//                 subnum = 6.8万;
//                 isHot = 1;
//                 tid = T1370583240249;
//                 img = http://img2.cache.netease.com/m/newsapp/banner/zhenhua.png;
//                 isNew = 0;
//                 template = manual;
//                 recommendOrder = 0;
//                 alias = The Truth;
//                 tag = hot;
//                 bannerOrder = 105;
//                 hasCover = 0;
//                 cid = C1348654575297;
//                 hasIcon = 1;
//                 ename = zhenhua;
//                 recommend = 0;
//                 headLine = 0;
//                 topicid = 00040BGE;
//                 special = 0;
//                 showType = comment;
//                 tagDate = 2015-06-16 10:45:34.0;
//             }

@end

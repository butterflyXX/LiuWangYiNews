//
//  LiuNewsModel.h
//  LiuWangYiNews
//
//  Created by 刘晓晨 on 2017/3/10.
//  Copyright © 2017年 刘晓晨. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LiuNewsModel : NSObject

/**
 标题
 */
@property(nonatomic,copy)NSString *title;

/**
 评论数
 */
@property(nonatomic,strong)NSNumber *replyCount;

/**
 来源
 */
@property(nonatomic,strong)NSString *source;

/**
 普通图片地址
 */
@property(nonatomic,strong)NSString *imgsrc;

/**
 多图图片数组
 */
@property(nonatomic,strong)NSArray *imgextra;

/**
 大图标记
 */
@property (nonatomic, assign) BOOL imgType;

//{
//    url_3w = http://news.163.com/17/0311/14/CF8L5GM8000189FH.html;
//    digest = 又是一年两会时，全国各地的人大代表纷纷来到北京，带着他们的议案和老百姓的希望和诉求到“两会”上。其中有这样三位特殊的代表：他们与考察或下团组的习近平总书记有过一;
//    ltitle = 人大代表眼中的习近平;
//    subtitle = ;
//    imgsrc = http://cms-bucket.nosdn.127.net/18cc0ad1577e4adaa038638b869d4ee120170311083147.png;
//    url = http://3g.163.com/news/17/0311/14/CF8L5GM8000189FH.html;
//    postid = CF8L5GM8000189FH;
//    source = 央视;
//    title = 人大代表眼中的习近平;
//    priority = 310;
//    votecount = 298;
//    lmodify = 2017-03-11 15:44:28;
//    docid = CF8L5GM8000189FH;
//    boardid = news2_bbs;
//    ptime = 2017-03-11 14:27:04;
//    replyCount = 615;
//}

//{
//    tname = 头条;
//    ptime = 2017-03-11 19:48:40;
//    source = 中国青年网;
//    title = 揭接收"萨德"的韩乌山基地 卫星图曝光;
//    imgextra = (
//                {
//                    imgsrc = http://cms-bucket.nosdn.127.net/26e2374c64384313a498095036bd331320170311194728.jpeg;
//                }
//                ,
//                {
//                    imgsrc = http://cms-bucket.nosdn.127.net/b32032e315c34b8a96ba99d62ed547be20170311194728.jpeg;
//                }
//                
//                )
//    ;
//    photosetID = 00AO0001|2241761;
//    postid = PHOT24D71000100A;
//    hasHead = 1;
//    hasImg = 1;
//    lmodify = 2017-03-11 19:50:11;
//    docid = 9IG74V5H00963VRO_CF97ICOLbjduleiupdateDoc;
//    template = normal1;
//    replyCount = 604;
//    votecount = 287;
//    alias = Top News;
//    hasCover = 0;
//    priority = 354;
//    imgsum = 21;
//    skipType = photoset;
//    cid = C1348646712614;
//    hasAD = 1;
//    imgsrc = http://cms-bucket.nosdn.127.net/7af0b02c58514fbebd3ef9f65da837ef20170311194728.png;
//    hasIcon = 1;
//    ads = (
//           {
//               url = 00AO0001|2241657;
//               title = 朴槿惠物品被搬回私邸 警方加强安保;
//               subtitle = ;
//               tag = photoset;
//               imgsrc = http://cms-bucket.nosdn.127.net/1b9ece3f0e1a4518a99de1498a37729920170311113216.jpeg;
//           }
//           ,
//           {
//               url = 00AP0001|2241628;
//               title = 郑州一处待建工地发现金字塔状古墓;
//               subtitle = ;
//               tag = photoset;
//               imgsrc = http://cms-bucket.nosdn.127.net/88dbfffaa206445eaa3eaa17db7a82fb20170311084506.jpeg;
//           }
//           ,
//           {
//               url = 00AO0001|2241656;
//               title = 福岛核泄漏后第六年，回望"3·11"灾难;
//               subtitle = ;
//               tag = photoset;
//               imgsrc = http://cms-bucket.nosdn.127.net/fc0dfe256b6747ba9b1310e3c1ba00fb20170311110643.jpeg;
//           }
//           ,
//           {
//               url = 19BR0001|2241388;
//               title = 一周图片:民众烛光集会要求逮捕朴槿惠;
//               subtitle = ;
//               tag = photoset;
//               imgsrc = http://cms-bucket.nosdn.127.net/8cd950bf999d435e94ae11b3fc7f3c6120170311075624.jpeg;
//           }
//           ,
//           {
//               url = 00AP0001|2241614;
//               title = 武汉大学樱花初绽 校园游客如织;
//               subtitle = ;
//               tag = photoset;
//               imgsrc = http://cms-bucket.nosdn.127.net/96c228dbcb6e4f288bdd7a59594f6d2320170311075057.jpeg;
//           }
//           
//           )
//    ;
//    ename = iosnews;
//    skipID = 00AO0001|2241761;
//    boardid = photoview_bbs;
//    order = 1;
//    topic_background = http://img2.cache.netease.com/m/newsapp/reading/cover1/C1348646712614.jpg;
//    digest = ;
//}

+(NSArray *)analysisDataWithArray:(NSArray *)array;

@end

//
//  LiuNetworkingManager.m
//  LiuWangYiNews
//
//  Created by 刘晓晨 on 2017/3/10.
//  Copyright © 2017年 刘晓晨. All rights reserved.
//

#import "LiuNetworkingManager.h"

@implementation LiuNetworkingManager


+(instancetype)sharedManger {
    static id manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] initWithBaseURL:[NSURL URLWithString:@"http://c.m.163.com/nc/article/list/"]];
    });
    return manager;
}

-(void)requestWithType:(requestType)type andURLString:(NSString *)urlString andParameters:(NSDictionary *)parameters andCompleteBlock:(void (^)(id responseObject))CompleteBlock {
    
    //通过枚举值判断是get请求还是post请求
    if (type == GET) {
        [self GET:urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            CompleteBlock(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"Error:%@",error);
        }];
    }
    else {
        [self GET:urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            CompleteBlock(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"Error:%@",error);
        }];
    }
//    switch (type) {
//        case GET:
//            [[AFHTTPSessionManager manager] GET:urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//                CompleteBlock(responseObject);
//            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//                NSLog(@"Error:%@",error);
//            }];
//            break;
//        case POST:
//            [[AFHTTPSessionManager manager] GET:urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//                CompleteBlock(responseObject);
//            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//                NSLog(@"Error:%@",error);
//            }];
//            break;
//            
//        default:
//            break;
//    }
}



@end








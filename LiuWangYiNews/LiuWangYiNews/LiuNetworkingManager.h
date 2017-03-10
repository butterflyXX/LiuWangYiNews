//
//  LiuNetworkingManager.h
//  LiuWangYiNews
//
//  Created by 刘晓晨 on 2017/3/10.
//  Copyright © 2017年 刘晓晨. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

typedef enum {
    GET,
    POST
} requestType;

@interface LiuNetworkingManager :AFHTTPSessionManager

+(instancetype)sharedManger;

-(void)requestWithType:(requestType)type andURLString:(NSString *)urlString andParameters:(NSDictionary *)parameters andCompleteBlock:(void(^)(id responseObject))CompleteBlock;

@end

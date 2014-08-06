//
//  LvesHttpTool.m
//  Lves新浪微博
//
//  Created by wildcat on 14-8-4.
//  Copyright (c) 2014年 com.wildcat. All rights reserved.
//  负责整个项目的get/post请求

#import "LvesHttpTool.h"
#import "AFNetworking.h"
#import "LvesAccountTool.h"

@implementation LvesHttpTool

#pragma mark request请求
+(void)requestWithBaseURL:(NSString *)baseURL path:(NSString *)path paras:(NSDictionary *)params success:(HttpSuccessBlock)success failure:(HttpFailureBlock)failure mathod:(NSString *)method{
    
    AFHTTPClient *client=[AFHTTPClient clientWithBaseURL:[NSURL URLWithString:baseURL]];
    
    //1. 拼接accessToken
    NSMutableDictionary *paramDic=[NSMutableDictionary dictionary];
    //1.1添加传进来的参数
    if (params) {
        [paramDic setDictionary:params];
    }
    //2.1 添加access_token
    NSString *accessToken=[LvesAccountTool sharedLvesAccountTool].currentAccount.accessToken;
    if (accessToken) {
        [paramDic setObject:accessToken forKey:@"access_token"];
    }
    
    
    
    
    //获得Request
    NSURLRequest *request=[client
                           requestWithMethod:method
                           path:path
                           parameters:paramDic];
    //发送POST请求
    NSOperation *opration=[AFJSONRequestOperation JSONRequestOperationWithRequest:request
    success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        if (success==nil)return ;
        success(JSON);
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        if (failure==nil) return ;
        failure(error);
    }];
    //开始发送请求
    [opration start];

    
}

#pragma mark get请求
+(void)getWithBaseURL:(NSString *)baseURL path:(NSString *)path paras:(NSDictionary *)params success:(HttpSuccessBlock)success failure:(HttpFailureBlock)failure{
    [self requestWithBaseURL:baseURL path:path paras:params success:success failure:failure mathod:@"GET"];

}

#pragma mark post请求
+(void)postWithBaseURL:(NSString *)baseURL path:(NSString *)path paras:(NSDictionary *)params success:(HttpSuccessBlock)success failure:(HttpFailureBlock)failure{

    [self requestWithBaseURL:baseURL path:path paras:params success:success failure:failure mathod:@"POST"];

}
@end

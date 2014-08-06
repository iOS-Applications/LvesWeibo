//
//  LvesHttpTool.h
//  Lves新浪微博
//
//  Created by wildcat on 14-8-4.
//  Copyright (c) 2014年 com.wildcat. All rights reserved.
//

#import <Foundation/Foundation.h>
///成功后调用block 返回值:void ;参数:JSON
typedef void (^HttpSuccessBlock)(id JSON);
typedef void (^HttpFailureBlock)(NSError *error);

@interface LvesHttpTool : NSObject

/*
 异步发送get请求
 @param baseURL 服务器跟地址：（IP+端口）www.baidu.com
 @param path 子路径
 @param paras post请求参数字典
 @param success 成功时调用block ，传递JSOn参数
 @param failure 失败时调用
 
 */
+(void)getWithBaseURL:(NSString *)baseURL path:(NSString *)path paras:(NSDictionary *)params success:(HttpSuccessBlock) success failure:(HttpFailureBlock) failure;


/*
 异步发送post请求
 @param baseURL 服务器跟地址：（IP+端口）www.baidu.com
 @param path 子路径
 @param paras post请求参数字典
 @param success 成功时调用block ，传递JSOn参数
 @param failure 失败时调用
 
 */
+(void)postWithBaseURL:(NSString *)baseURL path:(NSString *)path paras:(NSDictionary *)params success:(HttpSuccessBlock) success failure:(HttpFailureBlock) failure;



@end

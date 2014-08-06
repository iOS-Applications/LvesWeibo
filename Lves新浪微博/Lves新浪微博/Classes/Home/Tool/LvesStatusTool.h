//
//  LvesStatusTool.h
//  Lves新浪微博
//
//  Created by wildcat on 14-8-6.
//  Copyright (c) 2014年 com.wildcat. All rights reserved.
//  负责发送获得微博数据

#import <Foundation/Foundation.h>
///NSArray中保存的是微博对象
typedef void (^StatusSuccessBlock)(NSArray * statuses);
typedef void (^StatusFailureBlock)(NSError *error);

@interface LvesStatusTool : NSObject
/*
 
 */
+(void)statusWithSuccess:(StatusSuccessBlock)sccess failure:(StatusFailureBlock)failure;

@end

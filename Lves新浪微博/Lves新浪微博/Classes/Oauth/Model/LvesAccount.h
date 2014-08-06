//
//  Account.h
//  Lves新浪微博
//
//  Created by wildcat on 14-8-3.
//  Copyright (c) 2014年 com.wildcat. All rights reserved.
//  负责管理sina账号

#import <Foundation/Foundation.h>

@interface LvesAccount : NSObject<NSCoding>  //归档协议
///用户信息访问标记
@property (nonatomic,copy) NSString *accessToken;
///用户ID
@property (nonatomic,copy) NSString *uid;
@end

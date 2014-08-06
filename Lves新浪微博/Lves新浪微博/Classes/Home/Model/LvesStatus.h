//
//  LvesStatus.h
//  Lves新浪微博
//
//  Created by wildcat on 14-8-6.
//  Copyright (c) 2014年 com.wildcat. All rights reserved.
//  微博

#import <Foundation/Foundation.h>
@class LvesUser;
@interface LvesStatus : NSObject
///微博信息
@property (nonatomic,copy) NSString *text;
///微博用户
@property (nonatomic,strong) LvesUser *user;

/*
 通过字典进行初始化
 
 */
-(id) initWithDictionary:(NSDictionary *)dic;

@end

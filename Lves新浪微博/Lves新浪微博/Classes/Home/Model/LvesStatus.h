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
///微博配图
@property (nonatomic,strong)NSArray *picUrls;
///转发微博
@property (nonatomic,strong) LvesStatus *retweetedStatus;
///微博创建时间
@property (nonatomic ,copy)NSString * createdAt;
///微博来源
@property (nonatomic ,copy)NSString * source;
///转发数
@property (nonatomic,assign)int repostsCount;

///评论数
@property (nonatomic,assign)int commentsCount;
///表态数
@property (nonatomic,assign)int attitudesCount;
///





/*
 通过字典进行初始化
 
 */
-(id) initWithDictionary:(NSDictionary *)dic;

@end

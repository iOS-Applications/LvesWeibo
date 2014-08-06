//
//  LvesUser.h
//  Lves新浪微博
//
//  Created by wildcat on 14-8-6.
//  Copyright (c) 2014年 com.wildcat. All rights reserved.
//  微博用户

#import <Foundation/Foundation.h>

@interface LvesUser : NSObject
///用户昵称
@property (nonatomic,copy) NSString *screenName;

/*
 通过字典进行初始化
 
 */
-(id) initWithDictionary:(NSDictionary *)dic;

@end

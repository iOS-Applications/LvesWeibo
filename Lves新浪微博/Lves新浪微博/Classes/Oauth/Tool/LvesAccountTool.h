//
//  LvesAccountTool.h
//  Lves新浪微博
//
//  Created by wildcat on 14-8-3.
//  Copyright (c) 2014年 com.wildcat. All rights reserved.
//  管理所有的账号信息

#import <Foundation/Foundation.h>
#import "Singleton.h"
#import "LvesAccount.h"

@interface LvesAccountTool : NSObject
///当前账号
@property (nonatomic,readonly) LvesAccount *currentAccount;


/*!
 单例
 */
single_interface(LvesAccountTool)
/*!
 归档账号信息
 @param account:要归档的账号
 
 */
-(void)saveAccount:(LvesAccount *)account;




@end

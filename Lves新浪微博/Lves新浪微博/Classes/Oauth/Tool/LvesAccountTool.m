//
//  LvesAccountTool.m
//  Lves新浪微博
//
//  Created by wildcat on 14-8-3.
//  Copyright (c) 2014年 com.wildcat. All rights reserved.
//

#import "LvesAccountTool.h"
///文件路径
// 文件路径
#define kFile [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"account.data"]


@implementation LvesAccountTool

#pragma mark 单例

////1.有一个全局实例
//static LvesAccountTool *_instance;
////2.全局类方法
//+(id)sharedAccountTool{
//    if (_instance==nil) {
//        _instance=[[self alloc] init];
//    }
//    return _instance;
//}
//#pragma mark 重写AllocWithZone
////3.重写alloc方法   因为Alloc底部调用AllocWithZone
//+(id)allocWithZone:(struct _NSZone *)zone{
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        _instance=[super allocWithZone:zone];
//    });
//    return _instance;
//}
single_implementation(LvesAccountTool)

#pragma mark 重写初始化方法
//工具类一初始化的时候就去读取账号信息
-(id)init{
    if (self=[super init]) {
        _currentAccount=[NSKeyedUnarchiver unarchiveObjectWithFile:kFile];
    }
    return self;
}
#pragma mark 保存账号信息
-(void)saveAccount:(LvesAccount *)account{
  
    _currentAccount=account;
    //归档
    [NSKeyedArchiver archiveRootObject:account toFile:kFile];
    
    
}
@end

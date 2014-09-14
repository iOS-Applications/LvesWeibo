//
//  LvesUser.h
//  Lves新浪微博
//
//  Created by wildcat on 14-8-6.
//  Copyright (c) 2014年 com.wildcat. All rights reserved.
//  微博用户

#import <Foundation/Foundation.h>

///认证类型枚举
typedef enum {
    ///无认证
    kVerifiedTypeNone=-1,
    ///个人认证
    kVerifiedTypePerson=0,
    ///企业官方
    kVerifiedTypeEnterprice=2,
    ///媒体官方
    kVerifiedTypeMedia=3,
    ///网站官方
    kVerifiedTypeOrgWebsite=5,
    ///达人
    kVerifiedTypeDaren=220

}VerifiedType;



@interface LvesUser : NSObject
///用户昵称
@property (nonatomic,copy) NSString *screenName;
///用户头像地址（中图），50×50像素

@property (nonatomic,copy)NSString *profileImageUrl;
///是否认证
@property (nonatomic,assign)BOOL verified;
///认证类型
@property (nonatomic,assign)VerifiedType verifiedType;
///会员等级
@property (nonatomic,assign)int mbrank;
///会员类型
@property (nonatomic,assign)int mbtype;

/*
 通过字典进行初始化
 
 */
-(id) initWithDictionary:(NSDictionary *)dic;

@end

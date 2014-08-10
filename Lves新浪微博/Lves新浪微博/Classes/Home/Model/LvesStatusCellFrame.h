//
//  LvesStatusCellFrame;.h
//  Lves新浪微博
//
//  Created by wildcat on 14-8-10.
//  Copyright (c) CGRect 2014年 com.wildcat. All rights reserved.
//  一个StatusCellFrame;可以描述一个StausCell的内部所有子空间的Frame;

#import <Foundation/Foundation.h>
@class LvesStatus;
@interface LvesStatusCellFrame : NSObject

//微博模型
@property (nonatomic,strong) LvesStatus *status;

///头像
@property (nonatomic,readonly) CGRect iconFrame;

///昵称
@property (nonatomic,readonly) CGRect screenNameFrame;
///时间
@property (nonatomic,readonly) CGRect timeFrame;
///来源
@property (nonatomic,readonly) CGRect scoureFrame;
///内容
@property (nonatomic,readonly) CGRect textFrame;
///配图
@property (nonatomic,readonly) CGRect imageFrame;


///被转发微博的父控件
@property (nonatomic,readonly) CGRect reweetedFrame;
///被转发微博作者的昵称
@property (nonatomic,readonly) CGRect reweetedScreenNameFrame;
///被转发微博的内容
@property (nonatomic,readonly) CGRect reweetedTextFrame;
///被转发微博的配图
@property (nonatomic,readonly) CGRect reweetedImageFrame;

@end

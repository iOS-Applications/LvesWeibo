//
//  LvesStatusCellFrame;.h
//  Lves新浪微博
//
//  Created by wildcat on 14-8-10.
//  Copyright (c) CGRect 2014年 com.wildcat. All rights reserved.
//  一个StatusCellFrame;可以描述一个StausCell的内部所有子空间的Frame;

#import <Foundation/Foundation.h>

#define kCellBorderWidth 10
#define kScreenNameFont [UIFont systemFontOfSize:17]
#define kTimeFont [UIFont systemFontOfSize:17]
#define kSourceFont kTimeFont
#define kTextFont [UIFont systemFontOfSize:15]

#define kRetweetedTextFont [UIFont systemFontOfSize:16]
#define kRetweetScreenNameFont [UIFont systemFontOfSize:16]


@class LvesStatus;
@interface LvesStatusCellFrame : NSObject

//微博模型Frame
@property (nonatomic,strong) LvesStatus *status;

///Cell的高度
@property (nonatomic,readonly) CGFloat cellHeight;

///头像Frame
@property (nonatomic,readonly) CGRect iconFrame;

///昵称Frame
@property (nonatomic,readonly) CGRect screenNameFrame;
///时间Frame
@property (nonatomic,readonly) CGRect timeFrame;
///来源Frame
@property (nonatomic,readonly) CGRect sourceFrame;
///内容Frame
@property (nonatomic,readonly) CGRect textFrame;
///配图Frame
@property (nonatomic,readonly) CGRect imageFrame;


///被转发微博的父控件Frame
@property (nonatomic,readonly) CGRect retweetedFrame;
///被转发微博作者的昵称Frame
@property (nonatomic,readonly) CGRect retweetedScreenNameFrame;
///被转发微博的内容Frame
@property (nonatomic,readonly) CGRect retweetedTextFrame;
///被转发微博的配图Frame
@property (nonatomic,readonly) CGRect retweetedImageFrame;

@end

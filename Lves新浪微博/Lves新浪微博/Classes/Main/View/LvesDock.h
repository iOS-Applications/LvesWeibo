//
//  LvesDock.h
//  Lves新浪微博
//
//  Created by wildcat on 14-6-22.
//  Copyright (c) 2014年 com.wildcat. All rights reserved.
//  底部的工具条 选项卡条

#import <UIKit/UIKit.h>

@class LvesDock;
#pragma mark 定义一个代理
@protocol DockDelegate <NSObject>
@optional
-(void)dock:(LvesDock *)dock itemSelectedFrom:(NSInteger)from to:(NSInteger) to;
@end


#pragma mark - LvesDock
@interface LvesDock : UIView
/*!
 添加一个选项卡
 @param 图片名 标题
 @return void
 */
-(void)addItemWithIcon:(NSString *)icon highlightIcon:(NSString *)hightLighted title:(NSString *)title;
///Dock的代理
@property (nonatomic,weak) id <DockDelegate> delegate;

@end

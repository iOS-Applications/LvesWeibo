//
//  LvesDock.m
//  Lves新浪微博
//
//  Created by wildcat on 14-6-22.
//  Copyright (c) 2014年 com.wildcat. All rights reserved.
//

#import "LvesDock.h"
#import "LvesDockItem.h"
#import "NSString+Lves.h"


@implementation LvesDock

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tabbar_background.png"]];
    }
    return self;
}
#pragma mark 添加一个选项卡
-(void)addItemWithIcon:(NSString *)icon title:(NSString *)title{
    
    //1.创建Item
    LvesDockItem *item=[[LvesDockItem alloc] init];
    //设置文字
    [item setTitle:title forState:UIControlStateNormal];
    //设置默认图片
    [item setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    //设置选中图片
    [item setImage:[UIImage imageNamed:[icon fileAppend:@"_selected"]] forState:UIControlStateSelected];
    
    //2.添加Item
    [self addSubview:item];
    
//    [UIView beginAnimations:nil context:nil];
    //3.调整所有item的Frame
    NSUInteger count=self.subviews.count;
    CGFloat height=self.frame.size.height; //高度
    CGFloat width=self.frame.size.width/count;  //宽度
    for (NSUInteger i=0; i<count; i++) {
        LvesDockItem *dockItem=self.subviews[i];
        dockItem.frame=CGRectMake(i*width, 0, width, height);
    }
   
//    [UIView commitAnimations];
    
    
}

@end












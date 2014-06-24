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

@interface LvesDock (){
    LvesDockItem *_selectItem;  //记录当前选中Item

}

@end


@implementation LvesDock
@synthesize delegate=_delegate;


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
    ///监听Item 的点击
    [item addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchDown];
    
    
    
    //2.添加Item
    [self addSubview:item];
    
//    [UIView beginAnimations:nil context:nil];
    //3.调整所有item的Frame
    NSUInteger count=self.subviews.count;
    if (1==count) {
        //            dockItem.selected=YES;  //默认选中第一个
        //            _selectItem=dockItem;
        [self itemClick:item];
    }
    
    CGFloat height=self.frame.size.height; //高度
    CGFloat width=self.frame.size.width/count;  //宽度
    for (NSUInteger i=0; i<count; i++) {
        LvesDockItem *dockItem=self.subviews[i];
        dockItem.tag=i;
        dockItem.frame=CGRectMake(i*width, 0, width, height);
 
        
    }
   
//    [UIView commitAnimations];
    
    
}
#pragma mark 点击按钮
-(void)itemClick:(LvesDockItem *)item{
    
    //通知代理
    if ([_delegate respondsToSelector:@selector(dock:itemSelectedFrom:to:)]) {
        [_delegate dock:self itemSelectedFrom:_selectItem.tag to:item.tag];
    }
    //1.取消以前选中的
    _selectItem.selected=NO;
    
    //2.选中点击item
    item.selected=YES;
    //3.设置当前选中
    _selectItem=item;
    
   
    
    
}



@end












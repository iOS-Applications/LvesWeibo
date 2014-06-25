//
//  UIBarButtonItem+Lves.m
//  Lves新浪微博
//
//  Created by wildcat on 14-6-25.
//  Copyright (c) 2014年 com.wildcat. All rights reserved.
//

#import "UIBarButtonItem+Lves.h"

@implementation UIBarButtonItem (Lves)
-(id)initWithIcon:(NSString *)icon highlightedIcon:(NSString *)highlighted target:(id)target action:(SEL)action{
    
    //1. 创建按钮
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    //2. 设置按钮背景
    UIImage *image=[UIImage imageNamed:icon];
    [btn setBackgroundImage:image forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:highlighted] forState:UIControlStateHighlighted];
    //3. 设置按钮尺寸
    btn.bounds=(CGRect){CGPointZero,image.size};
    //4. 添加监听
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    
    return [self initWithCustomView:btn];
}

+(id)itemWithIcon:(NSString *)icon highlightedIcon:(NSString *)highlighted target:(id)target action:(SEL)action{
    return [[self alloc] initWithIcon:icon highlightedIcon:highlighted target:target action:action];

}

@end

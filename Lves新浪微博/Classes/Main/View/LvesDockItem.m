//
//  LvesDockItem.m
//  Lves新浪微博
//
//  Created by wildcat on 14-6-22.
//  Copyright (c) 2014年 com.wildcat. All rights reserved.
//

#import "LvesDockItem.h"
#define kTitleRatio 0.3  //按钮中的标题所占高度比例
#define kTabbarSliderBG @"tabbar_slider.png"

@implementation LvesDockItem

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //1.设置文字居中
        self.titleLabel.textAlignment=NSTextAlignmentCenter;
        self.titleLabel.font=[UIFont systemFontOfSize:12.f];
        //2.设置图片填充
        self.imageView.contentMode=UIViewContentModeCenter;
        //3.设置选中时的背景
        [self setBackgroundImage:[UIImage imageNamed:kTabbarSliderBG] forState:UIControlStateSelected];
        
        
    }
    return self;
}

#pragma mark 覆盖highlight时的所有操作
-(void)setHighlighted:(BOOL)highlighted{

}

#pragma mark 调整内部ImageView的frame
-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    CGFloat imageX=0.0f;
    CGFloat imageY=0.0f;
    CGFloat width=contentRect.size.width;
    CGFloat height=contentRect.size.height*(1-kTitleRatio);

    return CGRectMake(imageX, imageY, width, height);
}

#pragma mark 调整内部Lable的frame
-(CGRect)titleRectForContentRect:(CGRect)contentRect{
    
    CGFloat width=contentRect.size.width;
    CGFloat height=contentRect.size.height*kTitleRatio;
    CGFloat titleX=0.0f;
    CGFloat titleY=contentRect.size.height-height-3.f;

    return CGRectMake(titleX, titleY, width, height);

}

@end

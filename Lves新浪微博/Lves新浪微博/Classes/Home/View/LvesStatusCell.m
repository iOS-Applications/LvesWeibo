//
//  LvesStatusCell.m
//  Lves新浪微博
//
//  Created by wildcat on 14-8-10.
//  Copyright (c) 2014年 com.wildcat. All rights reserved.
//

#import "LvesStatusCell.h"


@interface LvesStatusCell ()
{
    ///头像
    UIImageView *_icon;

    ///昵称
    UILabel *_screenName;
    ///时间
    UILabel *_time;
    ///来源
    UILabel *_scoure;
    ///内容
    UILabel *_text;
    ///配图
    UIImageView *_image;
    
    
    ///被转发微博的父控件
    UIImageView *_reweeted;
    ///被转发微博作者的昵称
    UILabel *_reweetedScreenName;
    ///被转发微博的内容
    UILabel *_reweetedText;
    ///被转发微博的配图
    UIImageView *_reweetedImage;
    
}

@end



@implementation LvesStatusCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        //添加自己的内容
        [self addAllSubviews];
        
        //添加转发的内容
        [self addAllReweetedViews];
        
        
    }
    return self;
}
#pragma mark 添加自己本身的子控件
-(void)addAllSubviews{
    ///头像
    _icon=[[UIImageView alloc]init];
    [self.contentView addSubview:_icon];
    ///昵称
    _screenName=[[UILabel alloc] init];
    [self.contentView addSubview:_screenName];
    ///时间
    _time=[[UILabel alloc] init];
    [self.contentView addSubview:_time];
    ///来源
    _scoure=[[UILabel alloc] init];
    [self.contentView addSubview:_scoure];
    ///内容
    _text=[[UILabel alloc] init];
    [self.contentView addSubview:_text];
    ///配图
    _image=[[UIImageView alloc]init];
    [self.contentView addSubview:_image];
    

}

#pragma mark 添加转发内容

-(void)addAllReweetedViews{
    ///被转发微博的父控件
    _reweeted=[[UIImageView alloc]init];
    [self.contentView addSubview:_reweeted];
    ///被转发微博作者的昵称
    _reweetedScreenName=[[UILabel alloc] init];
    [_reweeted addSubview:_reweetedScreenName];
    ///被转发微博的内容
    _reweetedText=[[UILabel alloc] init];
    [_reweeted addSubview:_reweetedText];
    ///被转发微博的配图
    _reweetedImage=[[UIImageView alloc] init];
    [_reweeted addSubview:_reweetedImage];

}

@end

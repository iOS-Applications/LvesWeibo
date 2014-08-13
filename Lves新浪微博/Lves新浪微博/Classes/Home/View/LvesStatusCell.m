//
//  LvesStatusCell.m
//  Lves新浪微博
//
//  Created by wildcat on 14-8-10.
//  Copyright (c) 2014年 com.wildcat. All rights reserved.
//

#import "LvesStatusCell.h"
#import "LvesStatusCellFrame.h"
#import "LvesStatus.h"
#import "LvesUser.h"
#import "UIImageView+WebCache.h"

@interface LvesStatusCell ()
{
    ///头像
    UIImageView *_icon;

    ///昵称
    UILabel *_screenName;
    ///时间
    UILabel *_time;
    ///来源
    UILabel *_source;
    ///内容
    UILabel *_text;
    ///配图
    UIImageView *_image;
    
    
    ///被转发微博的父控件
    UIImageView *_retweeted;
    ///被转发微博作者的昵称
    UILabel *_retweetedScreenName;
    ///被转发微博的内容
    UILabel *_retweetedText;
    ///被转发微博的配图
    UIImageView *_retweetedImage;
    
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
    // 1.头像
    _icon = [[UIImageView alloc] init];
    [self.contentView addSubview:_icon];
    
    // 2.昵称
    _screenName = [[UILabel alloc] init];
    _screenName.font = kScreenNameFont;
    [self.contentView addSubview:_screenName];
    
    // 3.时间
    _time = [[UILabel alloc] init];
    _time.font = kTimeFont;
    [self.contentView addSubview:_time];
    
    // 4.来源
    _source = [[UILabel alloc] init];
    _source.font = kSourceFont;
    [self.contentView addSubview:_source];
    
    // 5.内容
    _text = [[UILabel alloc] init];
    _text.numberOfLines = 0;
    _text.font = kTextFont;
    [self.contentView addSubview:_text];
    
    // 6.配图
    _image = [[UIImageView alloc] init];
    [self.contentView addSubview:_image];
}

#pragma mark 添加转发内容

-(void)addAllReweetedViews{
    ///被转发微博的父控件
    _retweeted=[[UIImageView alloc]init];
    [self.contentView addSubview:_retweeted];
    ///被转发微博作者的昵称
    _retweetedScreenName=[[UILabel alloc] init];
    [_retweeted addSubview:_retweetedScreenName];
    ///被转发微博的内容
    _retweetedText=[[UILabel alloc] init];
    _retweetedText.numberOfLines=0;
    [_retweeted addSubview:_retweetedText];
    ///被转发微博的配图
    _retweetedImage=[[UIImageView alloc] init];
    [_retweeted addSubview:_retweetedImage];

}

#pragma mark - 自定义FrameSetter函数
-(void)setStatusCellFrame:(LvesStatusCellFrame *)statusCellFrame{
    _statusCellFrame = statusCellFrame;
    
    LvesStatus *s = statusCellFrame.status;
    
    // 1.头像
    _icon.frame = statusCellFrame.iconFrame;
    [_icon sd_setImageWithURL:[NSURL URLWithString:s.user.profileImageUrl] placeholderImage:[UIImage imageNamed:@"Icon.png"] options:SDWebImageRetryFailed | SDWebImageLowPriority];
    
    // 2.昵称
    _screenName.frame = statusCellFrame.screenNameFrame;
    _screenName.text = s.user.screenName;
    
    // 3.时间
    _time.frame = statusCellFrame.timeFrame;
    _time.text = s.createdAt;
    
    // 4.来源
    _source.frame = statusCellFrame.sourceFrame;
    _source.text = s.source;
    
    // 5.内容
    _text.frame = statusCellFrame.textFrame;
    _text.text = s.text;
    
    // 6.配图
    if (s.picUrls.count) {
        _image.hidden = NO;
        _image.frame = statusCellFrame.imageFrame;
        //        MyLog(@"pic---%@", s.picUrls);
        NSString *imageStr = s.picUrls[0][@"thumbnail_pic"];
        NSURL *imageURL = [NSURL URLWithString:imageStr];
        [_image sd_setImageWithURL:imageURL placeholderImage:[UIImage imageNamed:@"Icon.png"] options:SDWebImageLowPriority | SDWebImageRetryFailed];
        //#warning 配图的图片
    } else {
        _image.hidden = YES;
    }
    
    // 7.被转发微博
    if (s.retweetedStatus) {
        _retweeted.hidden = NO;
        
        _retweeted.frame = statusCellFrame.retweetedFrame;
        
        // 8.昵称
        _retweetedScreenName.frame = statusCellFrame.retweetedScreenNameFrame;
        _retweetedScreenName.text = s.retweetedStatus.user.screenName;
        
        // 9.内容
        _retweetedText.frame = statusCellFrame.retweetedTextFrame;
        _retweetedText.text = s.retweetedStatus.text;
        
        // 10.配图
        if (s.retweetedStatus.picUrls.count) {
            _retweetedImage.hidden = NO;
            
            _retweetedImage.frame = statusCellFrame.retweetedImageFrame;
            
            [_retweetedImage sd_setImageWithURL:[NSURL URLWithString:s.retweetedStatus.picUrls[0][@"thumbnail_pic"]] placeholderImage:[UIImage imageNamed:@"Icon.png"] options:SDWebImageRetryFailed | SDWebImageLowPriority];
            
        } else {
            _retweetedImage.hidden = YES;
        }
    } else {
        _retweeted.hidden = YES;
    }

}


@end

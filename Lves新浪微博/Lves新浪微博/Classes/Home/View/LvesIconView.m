//
//  LvesIconView.m
//  Lves新浪微博
//
//  Created by wildcat on 14-8-24.
//  Copyright (c) 2014年 com.wildcat. All rights reserved.
//

#import "LvesIconView.h"
#import "LvesUser.h"
#import "UIImageView+WebCache.h"




@interface LvesIconView ()
{
    ///用户头像
    UIImageView *_icon;
    ///认证图标
    UIImageView *_vertify;
    ///展位图片
    NSString *_placeHoderStr;
    

}

@end


@implementation LvesIconView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //设置用户头像
        UIImageView *icon=[[UIImageView alloc] init];
        [self addSubview:icon];
        _icon=icon;
        //设置认证图片
        
        UIImageView *vertify=[[UIImageView alloc] init];
        [self addSubview:vertify];
        _vertify=vertify;
        
        
    }
    return self;
}
#pragma mark 设置图标类型
/*设置用户信息 重写setter方法*/
-(void)setUser:(LvesUser *)user{
    _user=user;
    //加载头像
    [_icon sd_setImageWithURL:[NSURL URLWithString:user.profileImageUrl] placeholderImage:[UIImage imageNamed:_placeHoderStr] options:SDWebImageRetryFailed|SDWebImageLowPriority];
    
    //判断认证类型
    NSString *vertifyImageStr=nil;
    switch (user.verifiedType) {
        case kVerifiedTypeNone:
            _vertify.hidden=YES;
            break;
        case kVerifiedTypeDaren:  //达人
            vertifyImageStr=@"avatar_grassroot.png";
            break;
        case kVerifiedTypePerson:  //个人V认证
            vertifyImageStr=@"avatar_vip.png";
            break;
        default:  //其他
            vertifyImageStr=@"avatar_enterprise_vip.png";
            break;

    }
    //加载认证头像
    if (vertifyImageStr) {
        _vertify.hidden=NO;
        _vertify.image=[UIImage imageNamed:vertifyImageStr];
    }
}
#pragma mark 设置尺寸
/*设置头像尺寸*/
-(void)setIconType:(IconType )iconType{
    _iconType=iconType;
    
    
    CGSize iconSize;
    switch (iconType) {
        case kIconTypeSmall:  //小头像
            iconSize=CGSizeMake(kIconSmallW, kIconSmallH);
            _placeHoderStr=@"avatar_default_small.png";
            break;
        case kIconTypeDefault:  //默认头像
            iconSize=CGSizeMake(kIconDefaultW, kIconDefaultH);
            _placeHoderStr=@"avatar_default.png";
            break;
        case kIcontypeBig:  //大头像
            iconSize=CGSizeMake(kIconBigW, kIconBigH);
            _placeHoderStr=@"avatar_default_big.png";
            break;
            
        default:
            break;
    }
    
    _icon.frame=(CGRect){CGPointZero,iconSize}; //设置头像Frame
    _vertify.bounds=CGRectMake(0, 0, kVertifyW, kVertifyH); //设置认证图片的大小
    _vertify.center=CGPointMake(iconSize.width, iconSize.height);  //设置中心点坐标
    
    //自己的大小
    CGFloat iconW=iconSize.width+kVertifyW*0.5;
    CGFloat iconH=iconSize.height+kVertifyH*0.5;
    self.bounds=CGRectMake(0, 0, iconW, iconH);

}
//重写父类方法，不允许覆盖
-(void)setFrame:(CGRect)frame{
    frame.size=self.bounds.size;
    [super setFrame:frame];
}
/*获得头像大小*/
+(CGSize)iconSizeWithType:(IconType)icontype{
    
    CGSize iconSize;
    switch (icontype) {
        case kIconTypeSmall:  //小头像
            iconSize=CGSizeMake(kIconSmallW, kIconSmallH);
            break;
        case kIconTypeDefault:  //默认头像
            iconSize=CGSizeMake(kIconDefaultW, kIconDefaultH);
            break;
        case kIcontypeBig:  //大头像
            iconSize=CGSizeMake(kIconBigW, kIconBigH);
            break;
            
        default:
            break;
    }
    //自己的大小
    CGFloat iconW=iconSize.width+kVertifyW*0.5;
    CGFloat iconH=iconSize.height+kVertifyH*0.5;
    return CGSizeMake(iconW, iconH);
    
}


@end

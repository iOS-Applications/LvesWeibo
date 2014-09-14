//
//  LvesIconView.h
//  Lves新浪微博
//
//  Created by wildcat on 14-8-24.
//  Copyright (c) 2014年 com.wildcat. All rights reserved.
//  头像

#import <UIKit/UIKit.h>
typedef enum {
    kIconTypeSmall,  //小
    kIconTypeDefault,//中
    kIcontypeBig     //大
}IconType;

#define kIconSmallW 34.f
#define kIconSmallH 34.f
#define kIconDefaultW 50.f
#define kIconDefaultH 50.f
#define kIconBigW 85.f
#define kIconBigH 85.f

#define kVertifyW 18.f
#define kVertifyH 18.f


@class LvesUser;
@interface LvesIconView : UIView
///用户信息
@property (nonatomic,strong) LvesUser *user;
///头像类型
@property (nonatomic,assign) IconType iconType;
/*获得头像大小*/
+(CGSize) iconSizeWithType:(IconType)icontype;

@end

//
//  UIImage+Addation.m
//  Lves新浪微博
//
//  Created by wildcat on 14-5-28.
//  Copyright (c) 2014年 com.wildcat. All rights reserved.
//

#import "UIImage+Addation.h"
#import "NSString+Lves.h"
@implementation UIImage (Addation)

+(UIImage *)fullScrennImage:(NSString *)imgName{

    //1.如果是iphone5
    if (iphone5) {
        //扩展文件名
        imgName=[imgName fileAppend:@"-568h@2x"];
    }
    //2.加载图片
    return [self imageNamed:imgName];
}

+(UIImage *)resizeImage:(NSString *)imgName{
    //拉伸图片
    return  [[UIImage imageNamed:imgName] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10) resizingMode:UIImageResizingModeStretch];

}

@end

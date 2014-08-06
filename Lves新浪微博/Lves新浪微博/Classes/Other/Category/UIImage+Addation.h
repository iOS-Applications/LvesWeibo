//
//  UIImage+Addation.h
//  Lves新浪微博
//
//  Created by wildcat on 14-5-28.
//  Copyright (c) 2014年 com.wildcat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Addation)
/*
 加载全屏图片
 @param imgName 前缀文件名
 @return 一个添加后缀的图片
 */

+(UIImage *)fullScrennImage:(NSString *)imgName;

/*
 拉伸图片
 @param 需要拉伸的图片
 @return 拉伸后的图片
 */

+(UIImage *)resizeImage:(NSString *)imgName;



@end

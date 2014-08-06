//
//  NSString+Lves.m
//  Lves新浪微博
//
//  Created by wildcat on 14-6-22.
//  Copyright (c) 2014年 com.wildcat. All rights reserved.
//

#import "NSString+Lves.h"

@implementation NSString (Lves)
-(NSString *)fileAppend:(NSString *)append{
    //获得文件扩展名
    NSString *ext=[self pathExtension];
    //删除最后扩展名
    NSString *imgName=[self stringByDeletingPathExtension];
    //拼接-568h@2x
    imgName=[imgName stringByAppendingString:append];
    //拼接扩展名
    return [imgName stringByAppendingPathExtension:ext];
}
@end

//
//  NSString+Lves.h
//  Lves新浪微博
//
//  Created by wildcat on 14-6-22.
//  Copyright (c) 2014年 com.wildcat. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Lves)

/*!
 文件名扩展
 @param append:要扩展的文件名内容
 @return NSStirng :扩展后的文件名
 
 */

-(NSString *)fileAppend:(NSString *)append;
@end

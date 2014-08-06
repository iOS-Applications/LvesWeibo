//
//  UIBarButtonItem+Lves.h
//  Lves新浪微博
//
//  Created by wildcat on 14-6-25.
//  Copyright (c) 2014年 com.wildcat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Lves)
-(id)initWithIcon:(NSString *)icon highlightedIcon:(NSString *)highlighted target:(id)target action:(SEL)action;
+(id)itemWithIcon:(NSString *)icon highlightedIcon:(NSString *)highlighted target:(id)target action:(SEL)action;
@end

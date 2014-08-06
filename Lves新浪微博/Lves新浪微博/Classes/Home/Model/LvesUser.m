//
//  LvesUser.m
//  Lves新浪微博
//
//  Created by wildcat on 14-8-6.
//  Copyright (c) 2014年 com.wildcat. All rights reserved.
//

#import "LvesUser.h"

@implementation LvesUser
-(id)initWithDictionary:(NSDictionary *)dic{
    if (self=[super init]) {
        self.screenName=dic[@"screen_name"];
    }
    return self;
}
@end

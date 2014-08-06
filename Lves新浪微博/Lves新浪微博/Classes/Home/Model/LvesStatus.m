//
//  LvesStatus.m
//  Lves新浪微博
//
//  Created by wildcat on 14-8-6.
//  Copyright (c) 2014年 com.wildcat. All rights reserved.
//

#import "LvesStatus.h"
#import "LvesUser.h"
@implementation LvesStatus
-(id)initWithDictionary:(NSDictionary *)dic{
    if (self=[super init]) {
        self.text=dic[@"text"];
        self.user=[[LvesUser alloc] initWithDictionary:dic[@"user"]];
    }
    return self;
}
@end

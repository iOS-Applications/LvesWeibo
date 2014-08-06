//
//  Account.m
//  Lves新浪微博
//
//  Created by wildcat on 14-8-3.
//  Copyright (c) 2014年 com.wildcat. All rights reserved.
//

#import "LvesAccount.h"

@implementation LvesAccount
#pragma mark 归档的时候使用
-(void)encodeWithCoder:(NSCoder *)aCoder{
   
    [aCoder encodeObject:self.accessToken forKey:@"accessToken"];
    [aCoder encodeObject:self.uid forKey:@"uid"];
}
#pragma mark 解档
-(id)initWithCoder:(NSCoder *)aDecoder{
    if (self=[super init]) {
        self.accessToken=[aDecoder decodeObjectForKey:@"accessToken"];
        self.uid=[aDecoder decodeObjectForKey:@"uid"];
    }
    return self;
}

@end

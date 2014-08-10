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
        self.picUrls=dic[@"pic_urls"];
        NSDictionary *retweet=dic[@"retweeted_status"];
        if (retweet) { //如果是转发微博
            self.retweetedStatus=[[LvesStatus alloc] initWithDictionary:retweet];

        }
        
        self.createdAt=dic[@"created_at"];
        self.source=dic[@"source"];
        
        self.repostsCount=[dic[@"reposts_count"] intValue];
        self.commentsCount=[dic[@"comments_count"] intValue];
        self.attitudesCount=[dic[@"attitudes_count"] intValue];
        
    }
    return self;
}
@end

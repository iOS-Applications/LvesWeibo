//
//  LvesStatusTool.m
//  Lves新浪微博
//
//  Created by wildcat on 14-8-6.
//  Copyright (c) 2014年 com.wildcat. All rights reserved.
//

#import "LvesStatusTool.h"
#import "LvesHttpTool.h"
#import "LvesStatus.h"
@implementation LvesStatusTool
+(void)statusWithSuccess:(StatusSuccessBlock)success failure:(StatusFailureBlock)failure{
    
   
    
    [LvesHttpTool getWithBaseURL:kBaseURL
                            path:@"2/statuses/home_timeline.json"
                           paras:nil success:^(id JSON) {
                               if (success==nil)return ;
                            NSMutableArray *statuses=[NSMutableArray array];
                               //解析json
                               
                            NSArray *array=JSON[@"statuses"];
                             for (NSDictionary *dic in array) {
                                 LvesStatus *status=[[LvesStatus alloc] initWithDictionary:dic];
                                 [statuses addObject:status];//添加到微博数组
                             }
                             success(statuses);
                         }
                         failure:^(NSError *error) {
                             if (failure==nil) return ;
                             failure(error);
                         }];

}
@end

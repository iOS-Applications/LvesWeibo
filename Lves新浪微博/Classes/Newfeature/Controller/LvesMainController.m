//
//  LvesMainController.m
//  Lves新浪微博
//
//  Created by wildcat on 14-5-25.
//  Copyright (c) 2014年 com.wildcat. All rights reserved.
//

#import "LvesMainController.h"
#import "LvesDock.h"
#define kDockHeight 44


@interface LvesMainController ()<DockDelegate>{
    LvesDock *_dock;

}

@end

@implementation LvesMainController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor redColor];
    
    //1.添加dock
    LvesDock *dock=[[LvesDock alloc] init];
    dock.frame=CGRectMake(0, self.view.frame.size.height-kDockHeight,self.view.frame.size.width, kDockHeight);
    //设置代理
    dock.delegate=self;
    
    
    [self.view addSubview:dock];
    //2. 往dock里填充内容
    [dock addItemWithIcon:@"tabbar_home.png" title:@"首页"];
    [dock addItemWithIcon:@"tabbar_message_center.png" title:@"消息"];
    [dock addItemWithIcon:@"tabbar_profile.png" title:@"我"];
    [dock addItemWithIcon:@"tabbar_discover.png" title:@"广场"];
    [dock addItemWithIcon:@"tabbar_more.png" title:@"更多"];
    //2.添加其他控制器
    
    _dock=dock;
    
}

#pragma mark - 实现Dock的代理方法
-(void)dock:(LvesDock *)dock itemSelectedFrom:(NSInteger)from to:(NSInteger)to{
   // NSLog(@"from :%lu -> to:%lu",from,to);
}

@end

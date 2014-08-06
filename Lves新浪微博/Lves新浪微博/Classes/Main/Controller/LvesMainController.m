//
//  LvesMainController.m
//  Lves新浪微博
//
//  Created by wildcat on 14-5-25.
//  Copyright (c) 2014年 com.wildcat. All rights reserved.
//

#import "LvesMainController.h"
#import "LvesHomeController.h"
#import "LvesMoreController.h"
#import "LvesMessageController.h"
#import "LvesMeController.h"
#import "LvesSquareController.h"
#import "LvesNavigationController.h"
@interface LvesMainController (){

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
#pragma mark - 生命周期函数
- (void)viewDidLoad
{
    [super viewDidLoad];
    //1.初始化所有的子控制器
    [self initChildViewControllers];
    //2.添加dockItem
    [self addDockItems];
   
}
#pragma mark- 初始化界面
#pragma mark 初始化子控制器
-(void)initChildViewControllers{
    //1 主页
    LvesHomeController *home=[[LvesHomeController alloc] init];
    
    LvesNavigationController *homeNav=[[LvesNavigationController alloc] initWithRootViewController:home];
    
    [self addChildViewController:homeNav];
    //2 消息
    LvesMessageController *msg=[[LvesMessageController alloc] init];
    LvesNavigationController *msgNav=[[LvesNavigationController alloc] initWithRootViewController:msg];
    [self addChildViewController:msgNav];
    
    //3 我
    LvesMeController *me=[[LvesMeController alloc] init];
    LvesNavigationController *meNav=[[LvesNavigationController alloc] initWithRootViewController:me];
    [self addChildViewController:meNav];
    //4 广场
    LvesSquareController *square=[[LvesSquareController alloc] init];
    LvesNavigationController *squareNav=[[LvesNavigationController alloc] initWithRootViewController:square];
    [self addChildViewController:squareNav];
    //5 更多
    LvesMoreController *more=[[LvesMoreController alloc] initWithStyle:UITableViewStyleGrouped];
    LvesNavigationController *moreNav=[[LvesNavigationController alloc] initWithRootViewController:more];
    [self addChildViewController:moreNav];
}
#pragma mark  初始化dock
-(void) addDockItems{
    
    //设置背景图片
    _dock.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tabbar_background.png"]];
    
    //2. 往dock里填充Item
    [_dock addItemWithIcon:@"tabbar_home.png" highlightIcon:@"tabbar_home_selected.png"  title:@"首页"];
    [_dock addItemWithIcon:@"tabbar_message_center.png" highlightIcon:@"tabbar_message_center_selected.png" title:@"消息"];
    [_dock addItemWithIcon:@"tabbar_profile.png" highlightIcon:@"tabbar_profile_selected.png" title:@"我"];
    [_dock addItemWithIcon:@"tabbar_discover.png" highlightIcon:@"tabbar_discover_selected.png" title:@"广场"];
    [_dock addItemWithIcon:@"tabbar_more.png" highlightIcon:@"tabbar_more_selected.png" title:@"更多"];
}





@end

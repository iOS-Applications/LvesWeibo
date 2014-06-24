//
//  LvesMainController.m
//  Lves新浪微博
//
//  Created by wildcat on 14-5-25.
//  Copyright (c) 2014年 com.wildcat. All rights reserved.
//

#import "LvesMainController.h"
#import "LvesDock.h"
#import "LvesHomeController.h"
#import "LvesMoreController.h"


#define kDockHeight 44


@interface LvesMainController ()<DockDelegate>{
   

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
    //2.初始化dock
    [self initDock];
    
    
    
    
    
}
#pragma mark- 初始化界面

#pragma mark 初始化子控制器
-(void)initChildViewControllers{
    //3.1 主页
    LvesHomeController *home=[[LvesHomeController alloc] init];
    [self addChildViewController:home];
    //3.2 消息
    UIViewController *msg=[[UIViewController alloc] init];
    msg.view.backgroundColor=[UIColor cyanColor];
    [self addChildViewController:msg];
    
    //3.3 我
    UIViewController *me=[[UIViewController alloc] init];
    me.view.backgroundColor=[UIColor yellowColor];
    [self addChildViewController:me];
    //3.4 广场
    UIViewController *square=[[UIViewController alloc] init];
    [square.view setBackgroundColor:[UIColor grayColor]];
    [self addChildViewController:square];
    //3.5 更多
    LvesMoreController *more=[[LvesMoreController alloc] init];
    [self addChildViewController:more];
}
#pragma mark  初始化dock
-(void) initDock{
    //1.1 创建一个Dock
    LvesDock *dock=[[LvesDock alloc] init];
    dock.frame=CGRectMake(0, self.view.frame.size.height-kDockHeight,self.view.frame.size.width, kDockHeight);
    //1.2 设置代理
    dock.delegate=self;
    //1.3 添加dock
    [self.view addSubview:dock];
    //2. 往dock里填充内容
    [dock addItemWithIcon:@"tabbar_home.png" title:@"首页"];
    [dock addItemWithIcon:@"tabbar_message_center.png" title:@"消息"];
    [dock addItemWithIcon:@"tabbar_profile.png" title:@"我"];
    [dock addItemWithIcon:@"tabbar_discover.png" title:@"广场"];
    [dock addItemWithIcon:@"tabbar_more.png" title:@"更多"];
}



#pragma mark - 实现Dock的代理方法
-(void)dock:(LvesDock *)dock itemSelectedFrom:(NSInteger)from to:(NSInteger)to{
    if (to<0||to>=self.childViewControllers.count) return;
    //0.移除旧的控制器
    UIViewController *oldVc=self.childViewControllers[from];
    [oldVc.view removeFromSuperview];
    //1.取出即将现实的控制器
    UIViewController *newVc=self.childViewControllers[to];
    CGFloat width=self.view.frame.size.width;
    CGFloat hight=self.view.frame.size.height-kDockHeight;
    newVc.view.frame=CGRectMake(0, 0, width, hight);
    //2.添加新的控制器view到MainViewController上边
    [self.view addSubview:newVc.view];
    
}

@end

//
//  LvesDockController.m
//  Lves新浪微博
//
//  Created by wildcat on 14-6-25.
//  Copyright (c) 2014年 com.wildcat. All rights reserved.
//

#import "LvesDockController.h"
#define kDockHeight 44


@interface LvesDockController ()<DockDelegate>

@end

@implementation LvesDockController

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
    //添加dock
    [self initDock];

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
    _dock=dock;
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

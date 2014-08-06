//
//  LvesNavigationController.m
//  Lves新浪微博
//
//  Created by wildcat on 14-6-25.
//  Copyright (c) 2014年 com.wildcat. All rights reserved.
//

#import "LvesNavigationController.h"

@interface LvesNavigationController ()

@end

@implementation LvesNavigationController

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
    //1. 设置导航栏的背景图片
    UINavigationBar *bar=[UINavigationBar appearance];
    //[bar setBackgroundImage:[UIImage imageNamed:@"navigationbar_background.png"] forBarMetrics:UIBarMetricsDefault];
    [bar setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"navigationbar_background.png"]]];
    
    //2. 设置导航栏文字的主题
    [bar setTitleTextAttributes:@{
                                  UITextAttributeTextColor:[UIColor blackColor],
                                  //设置阴影为0
                                  UITextAttributeTextShadowOffset:[NSValue valueWithUIOffset:UIOffsetZero]
                                  }];
    //3. 设置UIBarButtonItem的外观
    UIBarButtonItem *barItem=[UIBarButtonItem appearance];
    [barItem setBackgroundImage:[UIImage imageNamed:@"navigationbar_button_background.png"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [barItem setBackgroundImage:[UIImage imageNamed:@"navigationbar_button_background_pushed.png"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
    //4. 该item上边的文字样式
    NSDictionary *fontDic=@{
                            UITextAttributeTextColor:[UIColor darkGrayColor],
                            //设置阴影为0
                            UITextAttributeTextShadowOffset:[NSValue valueWithUIOffset:UIOffsetZero]
                            };
    [barItem setTitleTextAttributes:fontDic
                           forState:UIControlStateNormal];
    [barItem setTitleTextAttributes:fontDic
                           forState:UIControlStateHighlighted];
    

    //5. 设置状态栏样式
    [UIApplication sharedApplication].statusBarStyle=UIStatusBarStyleBlackOpaque;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

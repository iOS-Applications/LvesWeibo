//
//  LvesAppDelegate.m
//  Lves新浪微博
//
//  Created by wildcat on 14-5-25.
//  Copyright (c) 2014年 com.wildcat. All rights reserved.
//

#import "LvesAppDelegate.h"
#import "LvesMainController.h"
#import "LvesNewFeatureController.h"
#import "LvesOauthController.h"
#import "LvesAccountTool.h"

@implementation LvesAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    NSString *key=(NSString *)kCFBundleVersionKey;
    //1.从plist中获得版本号
    NSString *version=[NSBundle mainBundle].infoDictionary[key];
    //2.从沙盒中取出上次存储的版本号
    NSString *saveVersion=[[NSUserDefaults standardUserDefaults] objectForKey:key];
    if ([saveVersion isEqualToString:version]) {  //不是第一次打开
        application.statusBarHidden=NO;
        
       LvesAccount *account= [LvesAccountTool sharedLvesAccountTool].currentAccount;
        MyLog(@"account.accessToken%@",account.accessToken);
        if (account) {
            
            //已登录调到主页面
            self.window.rootViewController=[[LvesMainController alloc] init];
        }else {
            //调到登录授权页面
            self.window.rootViewController=[[LvesOauthController alloc] init];
        }
        
        
        
    }else{   //第一次使用新版本
        
        //更新沙盒中的版本号
        [[NSUserDefaults standardUserDefaults] setObject:version forKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];  //立即写入
        self.window.rootViewController=[[LvesNewFeatureController alloc] init];
    
    }
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

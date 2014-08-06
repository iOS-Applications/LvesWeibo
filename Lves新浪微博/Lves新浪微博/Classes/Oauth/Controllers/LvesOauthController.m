//
//  LvesOautController.m
//  Lves新浪微博
//
//  Created by wildcat on 14-8-2.
//  Copyright (c) 2014年 com.wildcat. All rights reserved.
//

#import "LvesOauthController.h"
#import "WeiBoConfig.h"
#import "LvesHttpTool.h"
#import "LvesAccountTool.h"
#import "LvesMainController.h"
#import "MBProgressHUD.h"

@interface LvesOauthController ()<UIWebViewDelegate>{
    UIWebView *_webView;
}

@end

@implementation LvesOauthController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
#pragma mark 加载页面
-(void)loadView{
    _webView=[[UIWebView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    self.view=_webView;

}
- (void)viewDidLoad
{
    [super viewDidLoad];
    //1.（登陆页面）获得未授权的请求标记
    NSString *urlStr=[kAuthorizeURL stringByAppendingFormat:@"?display=mobile&client_id=%@&redirect_uri=%@",kWeiBoAppKey,kRedirectURL];
    NSURL *url=[NSURL URLWithString:urlStr];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
    
    //设置代理
    _webView.delegate=self;
    
}
#pragma mark - WebViewDelegate
#pragma mark 
-(void)webViewDidStartLoad:(UIWebView *)webView{
    //显示指示器
    MBProgressHUD *hud=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText=@"加载中...";
    hud.dimBackground=YES;
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    //去除指示器
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
}

#pragma mark 拦截webView扥所有请求
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{

    MyLog(@":request:%@",request.URL);
    //1. 获得全路径
    NSString *urlStr=request.URL.absoluteString;
    //2. 获得范围
    NSRange range=[urlStr rangeOfString:@"code="];
    //3. 跳到回调地址，授权成功,截取请求标记
    if (range.length>0) {
        NSString *requestToken=[urlStr substringFromIndex:range.location+range.length];
        //4.获得访问标记
        [self getAccessToken:requestToken];
        
        return NO;
    }
    
    return  YES;
}
#pragma mark 获得AccessToken
-(void)getAccessToken:(NSString *)requestToken{
    
    [LvesHttpTool postWithBaseURL:kBaseURL
                             path:@"oauth2/access_token"
                            paras:@{
                               @"grant_type":@"authorization_code",
                               @"client_id":kWeiBoAppKey,
                               @"client_secret":kAppSecret,
                               @"redirect_uri":kRedirectURL,
                               @"code":requestToken, }
                          success:^(id JSON) {
                              //保存账户信息
                              LvesAccount *account=[[LvesAccount alloc] init];
                              account.accessToken=JSON[@"access_token"];
                              account.uid=JSON[@"uid"];
                              //存储用户信息
                              [[LvesAccountTool sharedLvesAccountTool] saveAccount:account];
                              [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
                              //跳到主页面
                              self.view.window.rootViewController=[[LvesMainController alloc] init];
                               }
                          failure:^(NSError *error) {
                              [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
                          }];
    
    
    

   

}


@end

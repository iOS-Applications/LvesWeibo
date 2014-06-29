//
//  LvesNewFeatureController.m
//  Lves新浪微博
//
//  Created by wildcat on 14-5-25.
//  Copyright (c) 2014年 com.wildcat. All rights reserved.
//

#import "LvesNewFeatureController.h"
#import "UIImage+Addation.h"
#import "LvesMainController.h"


#define kCount 4


@interface LvesNewFeatureController ()<UIScrollViewDelegate>{
    UIPageControl *_page;
    UIScrollView *_scrollView;

}

@end

@implementation LvesNewFeatureController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
#pragma mark - 自定义view
-(void)loadView{
    UIImageView *imageView=[[UIImageView alloc] init];
    imageView.frame=[UIScreen mainScreen].applicationFrame;
    imageView.image=[UIImage fullScrennImage:@"new_feature_background.png"];
    self.view=imageView;
    self.view.userInteractionEnabled=YES;
}
/*
 ScrollView 不能滚动的原因
 1.没设置contentSize
 2.没有获得抚摸事件
 3.没设置frame
 4.没有添加到控制器的view上边
 
。。。。。。。。。。。。。。。。。。
 
 
 一个空件无法显示
 1.没有设置高宽
 2.位置不对
 3.hidden=YES
*/


- (void)viewDidLoad
{
    [super viewDidLoad];
    //1.添加ScrollView
    [self addScrollView];
    
    //2. 添加图片
    [self addScrollImages];
    //3。 添加页面控制器
    [self addPageControl];

}

#pragma mark - UI界面初始化
#pragma mark 添加滚动视图
-(void)addScrollView{
    UIScrollView *scroll= [[UIScrollView alloc] init];
    scroll.frame=self.view.bounds;
    scroll.showsHorizontalScrollIndicator=NO; //隐藏垂直滚动条
    scroll.pagingEnabled=YES;  //页式滚动
    scroll.delegate=self;      //设置代理
    [self.view addSubview:scroll];
    CGSize size=scroll.frame.size;
    scroll.contentSize=CGSizeMake(kCount*size.width,0);
    _scrollView=scroll;

}
#pragma mark 添加滚动现实的图片
-(void)addScrollImages{
    CGSize size=self.view.frame.size;
    
    for (int i=0;i<kCount; i++) {
        UIImageView *imageView=[[UIImageView alloc] init];
        //显示图片
        NSString *imageName=[NSString stringWithFormat:@"new_feature_%i.png",i+1];
        imageView.image=[UIImage fullScrennImage:imageName];
        //设置fram
        imageView.frame=CGRectMake(size.width*i, 0, size.width, size.height);
        [_scrollView addSubview:imageView];
        
        if ((kCount-1)==i) {  //最后一个页面，添加两个按钮
            UIButton *start=[UIButton buttonWithType:UIButtonTypeCustom];
            
            UIImage *normalImage=[UIImage imageNamed:@"new_feature_finish_button.png"];
            [start setBackgroundImage:normalImage forState:UIControlStateNormal];
            [start setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button_highlighted.png"] forState:UIControlStateHighlighted];
            start.center=CGPointMake(size.width/2, size.height*0.8);
            start.bounds=(CGRect){CGPointZero,normalImage.size};
            [start addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
            
            [imageView addSubview:start];
            
            
            //分享
            UIButton *share=[UIButton buttonWithType:UIButtonTypeCustom];
            //选中状态
            UIImage *shareNormalImage=[UIImage imageNamed:@"new_feature_share_true.png"];
            [share setBackgroundImage:shareNormalImage forState:UIControlStateSelected];
            //未选中状态
            [share setBackgroundImage:[UIImage imageNamed:@"new_feature_share_false.png"] forState:UIControlStateNormal];
            share.center=CGPointMake(start.center.x, start.center.y-50);
            share.bounds=(CGRect){CGPointZero,shareNormalImage.size};
            [share addTarget:self action:@selector(share:) forControlEvents:UIControlEventTouchUpInside];
            share.selected=YES;   //默认是选中状态
            share.adjustsImageWhenHighlighted=NO;
            
            [imageView addSubview:share];
            imageView.userInteractionEnabled=YES;
            
        }
    }

}

#pragma mark 添加pageController
-(void)addPageControl
{

    CGSize size=self.view.frame.size;
    //3.添加UIPageController
    UIPageControl *page=[[UIPageControl alloc] init];
    page.pageIndicatorTintColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"new_feature_pagecontrol_point.png"]];
    page.currentPageIndicatorTintColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"new_feature_pagecontrol_checked_point.png"]];
    page.numberOfPages=kCount;
    page.center=CGPointMake(size.width*0.5, size.height*0.95);
    page.bounds=CGRectMake(0, 0, 150, 0);
    
    [self.view addSubview:page];
    _page=page;


}


#pragma mark - 监听按钮点击
#pragma mark start
-(void)start{
   MyLog(@"体验新特性");
    //跳转到主界面
    //1.获得主窗口
   // [UIApplication sharedApplication].keyWindow;
    //显示状态栏
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    self.view.window.rootViewController=[[LvesMainController alloc] init];
    
}
#pragma mark share
-(void) share:(UIButton *) btn{
    btn.selected=!btn.selected;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ScrollView delegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    _page.currentPage=scrollView.contentOffset.x/scrollView.frame.size.width;
}

@end




//
//  LvesHomeController.m
//  Lves新浪微博
//
//  Created by wildcat on 14-6-24.
//  Copyright (c) 2014年 com.wildcat. All rights reserved.
//


/*
 说明：
 使用SDWebImage异步加载图片
 
 */

#import "LvesHomeController.h"
#import "UIBarButtonItem+Lves.h"
#import "LvesStatusTool.h"
#import "LvesStatus.h"
#import "LvesUser.h"
#import "UIImageView+WebCache.h"
#import "LvesStatusCellFrame.h"
#import "LvesStatusCell.h"



@interface LvesHomeController (){
    NSMutableArray *_statusesFrame;//所有微博数据
}

@end

@implementation LvesHomeController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title=@"主页";
    
    //初始化界面
    [self buildUI];
    //获得微博数据
    [self loadStatusData];
    
}

#pragma mark - 初始化界面
-(void)buildUI{
    //1. 左边的Item
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem
                                           itemWithIcon:@"navigationbar_compose.png"
                                           highlightedIcon:@"navigationbar_compose_highlighted.png"
                                           target:self
                                           action:@selector(sendStatus)];
    
    //2. 右边的Item
    self.navigationItem.rightBarButtonItem=[UIBarButtonItem
                                            itemWithIcon:@"navigationbar_pop.png"
                                            highlightedIcon:@"navigationbar_pop_highlighted.png"
                                            target:self
                                            action:@selector(popMenu)];

}
#pragma mark -加载微博数据
-(void)loadStatusData{
    _statusesFrame=[NSMutableArray array];
   
    [LvesStatusTool statusWithSuccess:^(NSArray *statuses) {
        //1. 在拿到最新的微博数据的时候计算它的frame
        for (LvesStatus *status in statuses) {
            //创建frame
            LvesStatusCellFrame *frame=[[LvesStatusCellFrame alloc] init];
            frame.status=status; //设置status
            //添加到数组中
            [_statusesFrame addObject:frame];
        }
        //2。 加载数据
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        
    }];
    
    
    

}



#pragma mark - Item点击
#pragma mark 点击发微博按钮
-(void)sendStatus{
    MyLog(@"发微博");
}
#pragma mark 点击弹出菜单按钮
-(void)popMenu{
     MyLog(@"弹出菜单");
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return _statusesFrame.count;
}
//当有新的cell出现在界面中时调用
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    LvesStatusCell *cell = [tableView  dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[LvesStatusCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        
    }
    LvesStatusCellFrame *statusFrame=_statusesFrame[indexPath.row];
    //设置cell中子控件的frame和内容
    cell.statusCellFrame=statusFrame;
    
   
    return cell;

}

#pragma mark 设置Cell的高度  delegate方法
//只调用一次 一次性调用所有 ，每次tableView刷新数据的时候会调用
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

  
    
    return [_statusesFrame[indexPath.row] cellHeight];
}



@end

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

@interface LvesHomeController (){
    NSMutableArray *_statuses;//所有微博数据
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
    _statuses=[NSMutableArray array];
   
    [LvesStatusTool statusWithSuccess:^(NSArray *statuses) {
        [_statuses addObjectsFromArray:statuses]; //添加微博数据
        [self.tableView reloadData]; //加载数据
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

    return _statuses.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView  dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.textLabel.numberOfLines=0;  //设置标签为多行
        cell.textLabel.font=[UIFont systemFontOfSize:15.f];
        cell.detailTextLabel.font=[UIFont systemFontOfSize:12.0];
        cell.imageView.frame=CGRectMake(5, 5, 38, 38);
        
    }
    LvesStatus *status=_statuses[indexPath.row];
    
    //拼接转载内容
    NSString *text=status.text;
    //如果有转载
    if (status.retweetedStatus) {
        text=[text stringByAppendingFormat:@"\n%@",status.retweetedStatus.text];
    }
    
    
    
    cell.textLabel.text=text;
    cell.detailTextLabel.text=status.user.screenName;
    //异步下载图片
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:status.user.profileImageUrl]
                      placeholderImage:[UIImage imageNamed:@"Icon.png"]
                               options:SDWebImageLowPriority|SDWebImageRetryFailed];  //scroolView减速时延迟加载|失败时重新下载
    return cell;

}

#pragma mark 设置Cell的高度

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    //获得微博内容
    LvesStatus *status=_statuses[indexPath.row];
    //拼接转载内容
    NSString *text=status.text;
    if (status.retweetedStatus) {
        text=[text stringByAppendingFormat:@"\n*****%@",status.retweetedStatus.text];
    }
    //微博内容占据的空间
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:15.0f]};
    CGRect rect = [text boundingRectWithSize:CGSizeMake(220, CGFLOAT_MAX)
                                              options:NSStringDrawingUsesLineFragmentOrigin
                                           attributes:attributes
                                              context:nil];
    
    //昵称的高度
    CGFloat screenNameHight=[UIFont systemFontOfSize:13.f].lineHeight;
    CGFloat cellHeight=screenNameHight+rect.size.height+10;
    cellHeight=cellHeight<70?70:cellHeight;
    
    return cellHeight;
}



@end

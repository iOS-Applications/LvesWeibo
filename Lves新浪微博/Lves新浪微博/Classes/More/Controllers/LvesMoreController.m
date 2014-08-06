//
//  LvesMoreController.m
//  Lves新浪微博
//
//  Created by wildcat on 14-6-24.
//  Copyright (c) 2014年 com.wildcat. All rights reserved.
//

#pragma mark - 注销按钮分类
@interface LogoutBtn : UIButton

@end

@implementation LogoutBtn
//重写imageView的位置
-(CGRect)imageRectForContentRect:(CGRect)contentRect{

    CGFloat x=10;
    CGFloat y=0;
    CGFloat width=contentRect.size.width-2*x;
    CGFloat hight=contentRect.size.height;
    
    return CGRectMake(x, y, width, hight);
}


@end

#pragma mark - 更多视图
#import "LvesMoreController.h"
#import "UIImage+Addation.h"
#import "LvesGroupCell.h"



@interface LvesMoreController (){
    NSArray *_data;

}

@end

@implementation LvesMoreController

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
    //1. 加载UI
    [self loadUI];
    //2. 加载数据
    [self loadPlist];
    //3. 设置TableView的属性
    [self initTableView];
    
}
#pragma mark 设置tableView
-(void)initTableView{
    //1. 设置背景
    self.tableView.backgroundView=nil;
    self.tableView.backgroundColor=[UIColor colorWithRed:230/255.f green:230/255.f blue:230/255.f alpha:1.0f];
    //2. 设置TableView 的section的间距高度
    self.tableView.sectionHeaderHeight=5.f;
    self.tableView.sectionFooterHeight=0.f;
    //3. 在tableView的底部添加一个注销登录按钮
    LogoutBtn *logOutButton=[LogoutBtn buttonWithType:UIButtonTypeCustom];
    //3.1 设置标题
    [logOutButton setTitle:@"退出当前登录" forState:UIControlStateNormal];
    
    //3.2 设置背景图片
    [logOutButton setImage:[UIImage resizeImage:@"common_button_big_red.png"] forState:UIControlStateNormal];
    [logOutButton setImage:[UIImage resizeImage:@"common_button_big_red_highlighted.png"] forState:UIControlStateHighlighted];
    //tableFootView的宽度不用设置
    logOutButton.bounds=CGRectMake(0, 0, 0, 44);
    
    self.tableView.tableFooterView=logOutButton;
    //4.增加底部额外的滚动区域
    self.tableView.contentInset=UIEdgeInsetsMake(0, 0, 10, 0);

}


#pragma mark 加载数据
-(void)loadPlist{
    //获得路径
    NSURL *url=[[NSBundle mainBundle] URLForResource:@"More" withExtension:@"plist"];
   
    //读取数据 从plist文件
    _data=[NSArray arrayWithContentsOfURL:url];

}

#pragma mark 加载UI

-(void)loadUI{
    //设置标题
    self.title=@"更多";
    //设置右上角设置按钮
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]
                                            initWithTitle:@"设置"
                                            style:UIBarButtonItemStyleBordered
                                            target:self
                                            action:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return _data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *array=_data[section];
    return array.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section==_data.count-1) {
        return 10.f;
    }
    return 0.f;
}

#pragma mark 每当有一个cell进入屏幕视野范围内
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    LvesGroupCell *cell = [tableView  dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[LvesGroupCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
       cell.myTableView=self.tableView;
        
    }
       
    
    //1. 取出这行对应的字典数据
    NSDictionary*dic= _data[indexPath.section][indexPath.row];
    //2. 设置文字
    cell.textLabel.text=dic[@"name"];
    cell.indexPath=indexPath; //设置IndexPath
    
    //3.设置右边显示
    if (2==indexPath.section) {
        cell.cellType=kCellTypeLabel; //设置文字
        cell.rightLabel.text=indexPath.row?@"有图模式":@"经典主题"; //文字
    }else{
        cell.cellType=kCellTypeArrow; //设置箭头
    }
       
    
    return cell;
}

#pragma mark 设置cell选中后去除选中
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

@end

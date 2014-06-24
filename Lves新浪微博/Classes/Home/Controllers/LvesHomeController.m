//
//  LvesHomeController.m
//  Lves新浪微博
//
//  Created by wildcat on 14-6-24.
//  Copyright (c) 2014年 com.wildcat. All rights reserved.
//

#import "LvesHomeController.h"

@interface LvesHomeController ()

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
    //左边的Item
    UIButton *leftBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *leftImage=[UIImage imageNamed:@"navigationbar_compose.png"];
    [leftBtn setBackgroundImage:leftImage forState:UIControlStateNormal];
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"navigationbar_compose_highlighted.png"] forState:UIControlStateHighlighted];
    //设置尺寸
    leftBtn.bounds=(CGRect){CGPointZero,leftImage.size};
    //添加监听
    [leftBtn addTarget:self action:@selector(sendStatus) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    
    
    //右边的Item
    UIButton *rightBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *rightImage=[UIImage imageNamed:@"navigationbar_pop.png"];
    [rightBtn setBackgroundImage:rightImage forState:UIControlStateNormal];
    [rightBtn setBackgroundImage:[UIImage imageNamed:@"navigationbar_pop_highlighted.png"] forState:UIControlStateHighlighted];
    //设置尺寸
    rightBtn.bounds=(CGRect){CGPointZero,rightImage.size};
    //添加监听
    [rightBtn addTarget:self action:@selector(popMenu) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    
    
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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

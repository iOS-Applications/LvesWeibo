//
//  LvesGroupCell.m
//  Lves新浪微博
//
//  Created by wildcat on 14-7-29.
//  Copyright (c) 2014年 com.wildcat. All rights reserved.
//

#import "LvesGroupCell.h"
#import "UIImage+Addation.h"

@interface LvesGroupCell (){
    UIImageView *_bg;
    UIImageView *_selectBg;
    UIImageView *_rightArrow;
}

@end




@implementation LvesGroupCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
         //设置Cell的背景图片
        _bg=[[UIImageView alloc] init];
        self.backgroundView=_bg;
        
        _selectBg=[[UIImageView alloc] init];
        self.selectedBackgroundView=_selectBg;
        //清空TextLabel的背景颜色
        self.textLabel.backgroundColor=[UIColor clearColor];
        self.textLabel.highlightedTextColor=self.textLabel.textColor;
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}
#pragma mark 设置AccessoryType
-(void)setCellType:(CellType)cellType{
    _cellType=cellType;
    
    if (kCellTypeArrow==cellType) {  //箭头
        if (_rightLabel==nil) {
            _rightArrow=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"common_icon_arrow.png"]];
        }
        self.accessoryView=_rightArrow;
    }else if (kCellTypeLabel==cellType){ //文字
        
        if (_rightLabel==nil) {
            UILabel *label=[[UILabel alloc] init];
            label.bounds=CGRectMake(0, 0, 75, 44);         //大小
            label.backgroundColor=[UIColor clearColor];    //去除背景色
            //
            label.textColor=[UIColor grayColor];       //字体颜色
            label.font=[UIFont systemFontOfSize:12];   //字体大小
            label.textAlignment=NSTextAlignmentCenter; //中间对齐
            _rightLabel=label;
        }
        
       
        self.accessoryView=_rightLabel;   //添加label
        
    }else if(kCellTypeNone==cellType){  //空
        self.accessoryView=nil;
    }
}

#pragma mark 设置indexPath，在其中设置背景图片
-(void)setIndexPath:(NSIndexPath *)indexPath{
    //设置indexPath
    _indexPath=indexPath;
    
    //1. 当前组的总行数
    NSUInteger count=[self.myTableView numberOfRowsInSection:indexPath.section];
    //2. 设置Cell的背景图片
    if (1==count) {  //这组只有一行
        _bg.image=[UIImage resizeImage:@"common_card_background.png"];
        _selectBg.image=[UIImage resizeImage:@"common_card_background_highlighted.png"];
    }else if (indexPath.row==0) {  //首行
        _bg.image=[UIImage resizeImage:@"common_card_top_background.png"];
        _selectBg.image=[UIImage resizeImage:@"common_card_top_background_highlighted.png"];
    }else if (indexPath.row==count-1){ //最后一行
        _bg.image=[UIImage resizeImage:@"common_card_bottom_background.png"];
        _selectBg.image=[UIImage resizeImage:@"common_card_bottom_background_highlighted.png"];
    }else {
        _bg.image=[UIImage resizeImage:@"common_card_middle_background.png"];
        _selectBg.image=[UIImage resizeImage:@"common_card_middle_background_highlighted.png"];
    }
    
   
    

}
@end

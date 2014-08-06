//
//  LvesGroupCell.h
//  Lves新浪微博
//
//  Created by wildcat on 14-7-29.
//  Copyright (c) 2014年 com.wildcat. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    kCellTypeNone ,  //没有东西
    kCellTypeArrow, //箭头
    kCellTypeLabel, //文字

}CellType;


@interface LvesGroupCell : UITableViewCell
///右边的AccessoryLabel
@property (nonatomic,readonly) UILabel *rightLabel;
//左边样式
@property (nonatomic,assign) CellType cellType;
///TableView
@property (nonatomic,weak)UITableView *myTableView;  //这里属性要设为week避免循环引用

///设置cell的IndexPath
@property (nonatomic,strong) NSIndexPath *indexPath;
@end

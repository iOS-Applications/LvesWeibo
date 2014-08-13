//
//  LvesStatusCellFrame.m
//  Lves新浪微博
//
//  Created by wildcat on 14-8-10.
//  Copyright (c) 2014年 com.wildcat. All rights reserved.
//

#import "LvesStatusCellFrame.h"
#import "LvesStatus.h"
#import "LvesUser.h"


@implementation LvesStatusCellFrame


-(void)setStatus:(LvesStatus *)status{
    _status=status;
    
    //计算所有子控件的Frame
    CGFloat cellWidth=[UIScreen mainScreen].bounds.size.width;
    //1.头像
    CGFloat iconX=kCellBorderWidth;
    CGFloat iconY=kCellBorderWidth;
    _iconFrame=CGRectMake(iconX,iconY, 50, 50);
    //2.昵称
    CGFloat screenNameX=CGRectGetMaxX(_iconFrame)+kCellBorderWidth;
    CGFloat scrrenNameY=iconY;
    CGSize screenNameSize=[status.user.screenName sizeWithAttributes:@{NSFontAttributeName :kScreenNameFont}];
    _screenNameFrame=(CGRect){{screenNameX,scrrenNameY},screenNameSize};
    
    //3. 时间
    CGFloat timeNameX=screenNameX;
    CGFloat timeNameY=CGRectGetMaxY(_screenNameFrame)+kCellBorderWidth;
    CGSize timeNameSize=[status.createdAt sizeWithAttributes:@{NSFontAttributeName :kTimeFont}];
    
    _timeFrame=(CGRect){{timeNameX,timeNameY},timeNameSize};
    //4.来源
    CGFloat sourceX=CGRectGetMaxX(_timeFrame)+kCellBorderWidth;
    CGFloat sourceY=timeNameY;
    CGSize sourceSize=[status.source sizeWithAttributes:@{NSFontAttributeName:kSourceFont}];
    
    _sourceFrame=(CGRect){{sourceX,sourceY},sourceSize};
    
    
    
    //5. 微博内容
    CGFloat textX=iconX;
    CGFloat textY=CGRectGetMaxY(_sourceFrame)+kCellBorderWidth;
    NSDictionary *textAttributes = @{NSFontAttributeName: kTextFont};
    CGRect textRect = [status.text boundingRectWithSize:CGSizeMake(cellWidth-2*kCellBorderWidth, CGFLOAT_MAX)
                                     options:NSStringDrawingUsesLineFragmentOrigin
                                  attributes:textAttributes
                                     context:nil];
    
    
    
    _textFrame=(CGRect){{textX,textY},textRect.size};
    
    if (status.picUrls.count) { // 6.有配图
        CGFloat imageX = textX;
        CGFloat imageY = CGRectGetMaxY(_textFrame) + kCellBorderWidth;
        _imageFrame = CGRectMake(imageX, imageY, 100, 100);
    } else if (status.retweetedStatus) { // 7.有转发的微博
        // 被转发微博整体
        CGFloat retweetX = textX;
        CGFloat retweetY = CGRectGetMaxY(_textFrame) + kCellBorderWidth;
        CGFloat retweetWidth = cellWidth - 2 * kCellBorderWidth;
        CGFloat retweetHeight = kCellBorderWidth;
        
        // 8.被转发微博的昵称
        CGFloat retweetedScreenNameX = kCellBorderWidth;
        CGFloat retweetedScreenNameY = kCellBorderWidth;
        CGSize retweetedScreenNameSize = [status.retweetedStatus.user.screenName sizeWithAttributes:@{NSFontAttributeName:kRetweetScreenNameFont}];
        _retweetedScreenNameFrame= (CGRect){{retweetedScreenNameX, retweetedScreenNameY}, retweetedScreenNameSize};
        
        // 9.被转发微博的内容
        CGFloat retweetedTextX = retweetedScreenNameX;
        CGFloat retweetedTextY = CGRectGetMaxY(_retweetedScreenNameFrame) + kCellBorderWidth;
        NSDictionary *retweetTextAttributes = @{NSFontAttributeName: kRetweetedTextFont};
        CGRect retweetTextRect = [status.retweetedStatus.text boundingRectWithSize:CGSizeMake(retweetWidth - 2 * kCellBorderWidth, CGFLOAT_MAX)
                                                    options:NSStringDrawingUsesLineFragmentOrigin
                                                 attributes:retweetTextAttributes
                                                    context:nil];

        
        _retweetedTextFrame = (CGRect){{retweetedTextX, retweetedTextY}, retweetTextRect.size};
        
        // 10.被转发微博的配图
        if (status.retweetedStatus.picUrls.count) {
            CGFloat retweetedImageX = retweetedTextX;
            CGFloat retweetedImageY = CGRectGetMaxY(_retweetedTextFrame) + kCellBorderWidth;
            _retweetedImageFrame = CGRectMake(retweetedImageX, retweetedImageY, 100, 100);
            
            retweetHeight += CGRectGetMaxY(_retweetedImageFrame);
        } else {
            retweetHeight += CGRectGetMaxY(_retweetedTextFrame);
        }
        
        _retweetedFrame = CGRectMake(retweetX, retweetY, retweetWidth, retweetHeight);
    }
    
    // 11.整个cell的高度
    _cellHeight = kCellBorderWidth;
    if (status.picUrls.count) {
        _cellHeight += CGRectGetMaxY(_imageFrame);
    } else if (status.retweetedStatus) {
        _cellHeight += CGRectGetMaxY(_retweetedFrame);
    } else {
        _cellHeight += CGRectGetMaxY(_textFrame);
    }

}
@end




















//
//  YQScrollToChooseTextView.h
//  test
//
//  Created by shirly on 16/6/30.
//  Copyright © 2016年 shirly. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SELFWIDTH (self.frame.size.width)
#define SELFHEIGHT (self.frame.size.height)

@interface YQScrollToChooseLineView : UIView

@property (nonatomic, strong) NSMutableArray *dataArray;
//每个刻度之间的宽度
@property (nonatomic, assign) CGFloat cellWidth;
//间隔多少个标出数值
@property (nonatomic, assign) NSInteger interval;
//刻度线的高度
@property (nonatomic, assign) CGFloat tickMarkHeight;
//间隔的刻度线的高度
@property (nonatomic, assign) CGFloat tickMarkHeightOfInterval;
@end

//
//  YQScrollToChooseView.h
//  test
//
//  Created by shirly on 16/6/30.
//  Copyright © 2016年 shirly. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YQScrollToChooseView;

#define SELFWIDTH (self.frame.size.width)
#define SELFHEIGHT (self.frame.size.height)


@protocol YQScrollToChooseViewDelegate <NSObject>

- (void)scrollToChooseView:(YQScrollToChooseView *)scrollToChooseView changedValue:(NSString *)value;

@end

@interface YQScrollToChooseView : UIView

@property (nonatomic, assign)id<YQScrollToChooseViewDelegate>delegate;

//每个刻度之间的宽度
@property (nonatomic, assign) CGFloat cellWidth;
//间隔多少个标出数值
@property (nonatomic, assign) NSInteger interval;
//刻度线的高度
@property (nonatomic, assign) CGFloat tickMarkHeight;
//间隔的刻度线的高度
@property (nonatomic, assign) CGFloat tickMarkHeightOfInterval;

//每个刻度代表的数值
@property (nonatomic, strong) NSMutableArray *dataArray;
//一开始指的的数值
@property (nonatomic, copy) NSString *originSelectedValue;


@end

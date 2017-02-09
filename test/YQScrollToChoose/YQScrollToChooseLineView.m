//
//  YQScrollToChooseTextView.m
//  test
//
//  Created by shirly on 16/6/30.
//  Copyright © 2016年 shirly. All rights reserved.
//

#import "YQScrollToChooseLineView.h"

@implementation YQScrollToChooseLineView

- (void)drawRect:(CGRect)rect {
 
    [self drawLine];
}
- (void)drawLine {


    for (int i = 0 ; i < self.dataArray.count; i++) {
        
        if (i % self.interval == 0) {
            UIColor *lineColor = [UIColor yellowColor];
            [lineColor set];
            UIBezierPath *path = [UIBezierPath bezierPath];
            [path moveToPoint:CGPointMake(i*self.cellWidth, SELFHEIGHT-self.tickMarkHeightOfInterval)];
            [path addLineToPoint:CGPointMake(i*self.cellWidth, SELFHEIGHT)];
            path.lineWidth = 2;
            [path stroke];
        }else{
        
            UIColor *lineColor = [UIColor yellowColor];
            [lineColor set];
            UIBezierPath *path = [UIBezierPath bezierPath];
            [path moveToPoint:CGPointMake(i*self.cellWidth, SELFHEIGHT-self.tickMarkHeight)];
            [path addLineToPoint:CGPointMake(i*self.cellWidth, SELFHEIGHT)];
            path.lineWidth = 2;
            [path stroke];
        }
    }
}

@end

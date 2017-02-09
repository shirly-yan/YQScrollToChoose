
//
//  YQScrollToChooseView.m
//  test
//
//  Created by shirly on 16/6/30.
//  Copyright © 2016年 shirly. All rights reserved.
//

#import "YQScrollToChooseView.h"
#import "YQScrollToChooseLineView.h"

@interface YQScrollToChooseView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView ;

@end

@implementation YQScrollToChooseView

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        
    }
    return self;
}
- (void)setDataArray:(NSMutableArray *)dataArray {
    if (_dataArray != dataArray) {
        _dataArray = dataArray;
        [self configView];
        NSInteger index = [self.dataArray indexOfObject:self.originSelectedValue];
        [self scrollToSelectedIndex:index];
    }
}
- (void)scrollToSelectedIndex:(NSInteger)index {

    if (index < 0 || index >= self.dataArray.count) {
        return;
    }
    CGPoint p = CGPointMake(index * self.cellWidth, self.collectionView.contentOffset.y);
    self.collectionView.contentOffset = p;

    if ([self.delegate respondsToSelector:@selector(scrollToChooseView:changedValue:)]) {
        [self.delegate scrollToChooseView:self changedValue:[self.dataArray objectAtIndex:index]];
    }

}
- (void)configView {

    [self configCollectionView];
    [self configLineView];
    [self configTextView];
    [self configReferenceView];
}
- (void)configTextView {

    for (int i = 0; i < self.dataArray.count; i++) {
        
        
        if (i % self.interval == 0)  {
   
        UILabel * textLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.cellWidth*self.interval, 20)];
        textLabel.center = CGPointMake(i*self.cellWidth+SELFWIDTH/2, 20);
        [self.collectionView addSubview:textLabel];
        textLabel.text = [self.dataArray objectAtIndex:i];
        textLabel.textAlignment = NSTextAlignmentCenter;
        }
    }

    
}
- (void)configLineView {
    YQScrollToChooseLineView *lineView = [[YQScrollToChooseLineView alloc]initWithFrame:CGRectMake(SELFWIDTH/2, 0, (self.dataArray.count-1) * self.cellWidth, SELFHEIGHT)];
    [self.collectionView addSubview:lineView];
    lineView.backgroundColor = [UIColor clearColor];
    lineView.cellWidth = self.cellWidth;
    lineView.interval = self.interval;
    lineView.tickMarkHeight = self.tickMarkHeight;
    lineView.tickMarkHeightOfInterval = self.tickMarkHeightOfInterval;
    lineView.dataArray = self.dataArray;
}
- (void)configReferenceView {

    UIView *redView = [[UIView alloc]initWithFrame:CGRectMake((SELFWIDTH - 3)/2, SELFHEIGHT-30, 3, 30)];
    [self addSubview:redView];
    redView.backgroundColor = [UIColor redColor];
    
}
- (void)configCollectionView {

    /**********创建UICollectionView***********/
    //创建UICollectionViewFlowLayout 是苹果提供的标准的瀑布流样式
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout  alloc] init];
    
    //设置item的大小
    flowLayout.itemSize = CGSizeMake(self.cellWidth, SELFHEIGHT);
    //item的列间距
    flowLayout.minimumInteritemSpacing = 0;
    //item的行间距
    flowLayout.minimumLineSpacing = 0;
    //设置item上,左,下，右边界距离
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    //头部区域大小，横向纵向取得值不同
    flowLayout.headerReferenceSize = CGSizeMake(SELFWIDTH/2, SELFHEIGHT);
    //底部区域大小
    flowLayout.footerReferenceSize = CGSizeMake(SELFWIDTH/2, SELFHEIGHT);
    //滑动方向
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    //创建UICollectionView
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SELFWIDTH, SELFHEIGHT) collectionViewLayout:flowLayout];
    [self addSubview:self.collectionView];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.showsHorizontalScrollIndicator = NO;
    //签协议
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    /**********创建UICollectionView***********/
    
    /**********注册标示符**********/
    //注册cell,标示符必须与cell的一样
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    //注册表头和底部视图
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView"];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footerView"];
    /**********注册标示符***********/
    
    
}
//设置表头和底部内容
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (kind == UICollectionElementKindSectionHeader) {
        //代表表头
        //kind代表区域类型是表头还是底部
        //headerView是表头的重用标示符
        UICollectionReusableView *reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"headerView" forIndexPath:indexPath];
        reusableView.backgroundColor = [UIColor clearColor];
        return reusableView;
    }else
    {
        UICollectionReusableView *reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"footerView" forIndexPath:indexPath];
        reusableView.backgroundColor = [UIColor clearColor];
        return reusableView;
        
    }
    
}


/**********协议方法***********/
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count-1;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    //直接从从重用池里取
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:arc4random()%256 / 255.0 green:arc4random()%256 / 255.0 blue:arc4random()%256 / 255.0 alpha:arc4random()%256 / 255.0];
    return cell;
}
#pragma mark - page size
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    if (decelerate) {
        return;
    }else{
        [self scrollViewDidEndDecelerating:scrollView];
    }
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    CGFloat row = floorf(scrollView.contentOffset.x / self.cellWidth);
    if ((scrollView.contentOffset.x - row*self.cellWidth ) < self.cellWidth/2) {
        CGPoint p = CGPointMake(row*self.cellWidth, scrollView.contentOffset.y);
        [self setContentOffSetAnimation:p];
        
    }else{
        CGPoint p = CGPointMake((row+1)*self.cellWidth, scrollView.contentOffset.y);
        [self setContentOffSetAnimation:p];
    }
}
- (void)setContentOffSetAnimation:(CGPoint)p {
    
    [UIView animateWithDuration:.25 animations:^{
        self.collectionView.contentOffset = p;
    }];

}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

    CGFloat row = floorf(scrollView.contentOffset.x / self.cellWidth);

    if (row >= 0 && row <= self.dataArray.count-1) {
 
    if ((scrollView.contentOffset.x - row*self.cellWidth ) < self.cellWidth/2) {

        if ([self.delegate respondsToSelector:@selector(scrollToChooseView:changedValue:)]) {
            [self.delegate scrollToChooseView:self changedValue:[self.dataArray objectAtIndex:row]];
        }
    }else{
        if ([self.delegate respondsToSelector:@selector(scrollToChooseView:changedValue:)]) {
            [self.delegate scrollToChooseView:self changedValue:[self.dataArray objectAtIndex:row]];
        }
    }
        
    }

}
#pragma mark - getter
- (CGFloat)cellWidth {
    if (_cellWidth <= 0) {
        return 50;
    }
    return _cellWidth;
}
- (NSInteger)interval {
    if (_interval <= 0) {
        return 1;
    }
    return _interval;
}
- (CGFloat)tickMarkHeight {
    if (_tickMarkHeight <= 0) {
        return SELFHEIGHT/3;
    }
    return _tickMarkHeight;
}
- (CGFloat)tickMarkHeightOfInterval {
    if (_tickMarkHeightOfInterval <= 0) {
        return SELFHEIGHT/2;
    }
    return _tickMarkHeightOfInterval;
}
@end

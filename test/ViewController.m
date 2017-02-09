//
//  ViewController.m
//  test
//
//  Created by shirly on 16/6/30.
//  Copyright © 2016年 shirly. All rights reserved.
//

#import "ViewController.h"
#import "YQScrollToChooseView.h"

@interface ViewController ()<YQScrollToChooseViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UILabel *monthLabel;
@property (weak, nonatomic) IBOutlet UILabel *relationLabel;
@property (weak, nonatomic) IBOutlet UILabel *heightLabel;


@property (weak, nonatomic) IBOutlet YQScrollToChooseView *yearView;
@property (weak, nonatomic) IBOutlet YQScrollToChooseView *monthView;
@property (weak, nonatomic) IBOutlet YQScrollToChooseView *relationView;
@property (weak, nonatomic) IBOutlet YQScrollToChooseView *heightView;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //年份
    self.yearView.delegate = self;
    self.yearView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.yearView.layer.borderWidth = 2;
    self.yearView.layer.masksToBounds = YES;
    self.yearView.layer.cornerRadius = 10;
    self.yearView.cellWidth = 15;
    self.yearView.interval = 5;
    self.yearView.originSelectedValue = @"1991";
    
    NSMutableArray *yearArray = [NSMutableArray array];
    for (int i = 1906 ; i < 2017; i++) {
        [yearArray addObject:[NSString stringWithFormat:@"%d",i]];
    }
    self.yearView.dataArray = yearArray;
    
    //月份
    self.monthView.delegate = self;
    self.monthView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.monthView.layer.borderWidth = 2;
    self.monthView.layer.masksToBounds = YES;
    self.monthView.layer.cornerRadius = 10;
    self.monthView.originSelectedValue = @"6";
    
    NSMutableArray *monthArray = [NSMutableArray array];
    for (int i = 1 ; i < 13; i++) {
        [monthArray addObject:[NSString stringWithFormat:@"%d",i]];
    }
    self.monthView.dataArray = monthArray;

    //关系
    self.relationView.delegate = self;
    self.relationView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.relationView.layer.borderWidth = 2;
    self.relationView.layer.masksToBounds = YES;
    self.relationView.layer.cornerRadius = 10;
    self.relationView.originSelectedValue = @"其他";
    
    NSMutableArray *relationArray = [NSMutableArray arrayWithObjects:@"爸爸",@"妈妈",@"老公",@"老婆",@"儿子",@"女儿",@"爷爷",@"奶奶",@"哥哥",@"姐姐",@"弟弟",@"妹妹",@"其他", nil];

    self.relationView.dataArray = relationArray;
    
    
    //身高
    self.heightView.delegate = self;
    self.heightView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.heightView.layer.borderWidth = 2;
    self.heightView.layer.masksToBounds = YES;
    self.heightView.layer.cornerRadius = 10;
    self.heightView.cellWidth = 15;
    self.heightView.interval = 5;
    self.heightView.originSelectedValue = @"165";
    
    NSMutableArray *heightArray = [NSMutableArray array];
    for (int i = 120 ; i < 226; i++) {
        [heightArray addObject:[NSString stringWithFormat:@"%d",i]];
    }
    self.heightView.dataArray = heightArray;

}

- (void)scrollToChooseView:(YQScrollToChooseView *)scrollToChooseView changedValue:(NSString *)value {
    if (scrollToChooseView == self.yearView) {
        self.yearLabel.text = value;
    }
    if (scrollToChooseView == self.monthView) {
        self.monthLabel.text = value;
    }
    if (scrollToChooseView == self.relationView) {
        self.relationLabel.text = value;
    }
    if (scrollToChooseView == self.heightView) {
        self.heightLabel.text = value;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

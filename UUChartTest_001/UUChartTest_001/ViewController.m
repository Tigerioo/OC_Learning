//
//  ViewController.m
//  UUChartTest_001
//
//  Created by 林国强 on 15/6/15.
//  Copyright (c) 2015年 lynn. All rights reserved.
//

#import "ViewController.h"
#import "UUChart.h"

UUChart *chartView;

@interface ViewController ()<UUChartDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (chartView) {
        [chartView removeFromSuperview];
        chartView = nil;
    }
    
    NSLog(@"size is %f", [UIScreen mainScreen].bounds.size.width);
    
    chartView = [[UUChart alloc] initwithUUChartDataFrame:CGRectMake(10, 10, [UIScreen mainScreen].bounds.size.width - 30, 150) withSource:self withStyle:UUChartBarStyle];
    
    [chartView showInView:self.view];
}

#pragma mark - @required
//横坐标标题数组
- (NSArray *)UUChart_xLableArray:(UUChart *)chart
{
    
    NSMutableArray *xTitles = [NSMutableArray array];
    for (int i=0; i<10; i++) {
        NSString * str = [NSString stringWithFormat:@"A-%d",i];
        [xTitles addObject:str];
    }
    return xTitles;
}
//数值多重数组
- (NSArray *)UUChart_yValueArray:(UUChart *)chart
{
    NSArray *ary = @[@"10",@"20",@"30",@"40",@"50",
                     @"60",@"70",@"80",@"90",@"100"];
    
    return @[ary];
}

#pragma mark - @optional
//颜色数组
- (NSArray *)UUChart_ColorArray:(UUChart *)chart
{
    return @[UUGreen,UURed,UUBrown];
}
//显示数值范围
- (CGRange)UUChartChooseRangeInLineChart:(UUChart *)chart
{
   return CGRangeMake(100, 0);

}

@end

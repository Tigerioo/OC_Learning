//
//  ViewController.m
//  xiMaLaYa
//
//  Created by 林国强 on 15/4/28.
//  Copyright (c) 2015年 lynn. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat maxY = CGRectGetMaxY(self.lastBtn.frame) + 10;
    
    self.scrollView.contentSize = CGSizeMake(0, maxY);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

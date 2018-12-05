//
//  ViewController.m
//  IOS_001
//
//  Created by 林国强 on 15/3/3.
//  Copyright (c) 2015年 lynn. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)btnSelect{
    int num1 = [_num1.text intValue];
    int num2 = [_num2.text intValue];

    _result.text = [NSString stringWithFormat:@"%d", num1 + num2];
}

@end

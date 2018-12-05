//
//  ViewController.m
//  scrollViewTest
//
//  Created by 林国强 on 15/5/3.
//  Copyright (c) 2015年 lynn. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIButton *last;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CGFloat maxY = CGRectGetMaxY(self.last.frame) + 10;
    
    self.scrollView.contentSize = CGSizeMake(0, maxY);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

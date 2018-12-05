//
//  ViewController.m
//  01-MyBigPictureShow
//
//  Created by 林国强 on 15/4/28.
//  Copyright (c) 2015年 lynn. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *minionImage;
- (IBAction)scroll;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //使用固定的参数
//    self.scrollView.contentSize = CGSizeMake(500, 480);
    //使用UIImageView的大小
    self.scrollView.contentSize = self.minionImage.frame.size;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)scroll {
    //原始的动画方法
//    [UIView animateWithDuration:1.0 animations:^{
//      self.scrollView.contentOffset = CGPointMake(100, 0);
//    }];
    
    //scrollView自带的
//    CGPoint offset = CGPointMake(100, 0);
//    [self.scrollView setContentOffset:offset animated:YES];
    
    //动态增加
    CGPoint offset = self.scrollView.contentOffset;
    offset.x += 10;
    offset.y += 10;
    [self.scrollView setContentOffset:offset animated:YES];
    
    //contentInset
    self.scrollView.contentInset = UIEdgeInsetsMake(10, 20, 30, 40);
    
}
@end

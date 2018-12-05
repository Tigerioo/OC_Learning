//
//  ViewController.m
//  图片缩放
//
//  Created by 林国强 on 15/5/3.
//  Copyright (c) 2015年 lynn. All rights reserved.
//

#import "ViewController.h"

//申明使用什么代理
@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //获取最大X值和最大Y值
    CGFloat maxX = CGRectGetMaxX(self.imageView.frame);
    CGFloat maxY = CGRectGetMaxY(self.imageView.frame);
    
    self.scrollView.contentSize = CGSizeMake(maxX, maxY);
    
    //将当前scrollView的代理设置成当前代理
    self.scrollView.delegate = self;
    
    self.scrollView.maximumZoomScale = 2.0;
    self.scrollView.minimumZoomScale = 0.2;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    NSLog(@"------ 开始拖动");
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"------- 正在拖动");
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    NSLog(@"--------正在缩放");
    return self.imageView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

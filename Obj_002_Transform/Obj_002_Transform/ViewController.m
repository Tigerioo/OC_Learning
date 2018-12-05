//
//  ViewController.m
//  Obj_002_Transform
//
//  Created by 林国强 on 15/3/7.
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

- (IBAction)up {
    /*
        1. 旧的写法
     */
//    CGPoint cgPoint = _picture.center;
//    cgPoint.y-= 50;
//    _picture.center = cgPoint;
//    NSLog(@"y=%lf" , cgPoint.y);
    
    //第二种写法
    _picture.transform = CGAffineTransformTranslate(_picture.transform, 0, -10);
    NSLog(@"up:: x is %.0lf, y is %.0lf", _picture.center.x, _picture.center.y);
}

- (IBAction)down {
    _picture.transform = CGAffineTransformTranslate(_picture.transform, 0, 10);
    NSLog(@"down:: x is %.0lf, y is %.0lf", _picture.center.x, _picture.center.y);
}

- (IBAction)left {
    _picture.transform = CGAffineTransformTranslate(_picture.transform, -10, 0);
    NSLog(@"left:: x is %.0lf, y is %.0lf", _picture.center.x, _picture.center.y);
}

- (IBAction)right {
    _picture.transform = CGAffineTransformTranslate(_picture.transform, 10, 0);
    NSLog(@"right:: x is %.0lf, y is %.0lf", _picture.center.x, _picture.center.y);
}

- (IBAction)zoomIn {
    _picture.transform = CGAffineTransformScale(_picture.transform, 1.5, 1.5);
}
- (IBAction)zoomOut {
    _picture.transform = CGAffineTransformScale(_picture.transform, 0.5, 0.5);
}
- (IBAction)spinLeft {
    _picture.transform = CGAffineTransformRotate(_picture.transform, -M_PI_4);
}
- (IBAction)spinRight {
    _picture.transform = CGAffineTransformRotate(_picture.transform, M_PI_4);
}
@end

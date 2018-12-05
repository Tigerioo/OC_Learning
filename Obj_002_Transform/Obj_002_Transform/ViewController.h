//
//  ViewController.h
//  Obj_002_Transform
//
//  Created by 林国强 on 15/3/7.
//  Copyright (c) 2015年 lynn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *picture;

- (IBAction)up;//上移动

- (IBAction)down;//下移动

- (IBAction)left;//左移动

- (IBAction)right;//右移动

- (IBAction)zoomIn;//放大

- (IBAction)zoomOut;//缩小

- (IBAction)spinLeft;//左旋转

- (IBAction)spinRight;//右旋转



@end


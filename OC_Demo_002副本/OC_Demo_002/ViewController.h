//
//  ViewController.h
//  OC_Demo_002
//
//  Created by 林国强 on 15/3/13.
//  Copyright (c) 2015年 lynn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (assign, nonatomic)int picSeq;

@property (weak, nonatomic) IBOutlet UILabel *seqNum;

@property (weak, nonatomic) IBOutlet UILabel *desc;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UIButton *nextBtn;

@property (weak, nonatomic) IBOutlet UIButton *prevBtn;


- (IBAction)nextPic;//下一张图

- (IBAction)prevPic;//上一张图


@end


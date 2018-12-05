//
//  ViewController.h
//  IOS_001
//
//  Created by 林国强 on 15/3/3.
//  Copyright (c) 2015年 lynn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)btnSelect;

@property (nonatomic, weak) IBOutlet UITextField *num1;
@property (nonatomic, weak) IBOutlet UITextField *num2;
@property (nonatomic, weak) IBOutlet UILabel *result;

@end


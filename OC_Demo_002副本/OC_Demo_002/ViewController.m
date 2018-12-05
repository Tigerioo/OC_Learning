//
//  ViewController.m
//  OC_Demo_002
//
//  Created by 林国强 on 15/3/13.
//  Copyright (c) 2015年 lynn. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _picSeq = 0;
    [self nextPic];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)nextPic {
    _picSeq++;
    [self changeData];
    
  }

- (IBAction)prevPic {
    _picSeq--;
    [self changeData];
    
}

-(void)changeData {
    switch (_picSeq) {
        case 1:
            _imageView.image = [UIImage imageNamed:@"biaoqingdi"];
            _seqNum.text = [NSString stringWithFormat:@"%d/5", _picSeq];
            _desc.text = [NSString stringWithFormat:@"biaoqingdi"];
            break;
        case 2:
            _imageView.image = [UIImage imageNamed:@"bingli"];
            _seqNum.text = [NSString stringWithFormat:@"%d/5", _picSeq];
             _desc.text = [NSString stringWithFormat:@"bingli"];
            break;
        case 3:
            _imageView.image = [UIImage imageNamed:@"chiniupa"];
            _seqNum.text = [NSString stringWithFormat:@"%d/5", _picSeq];
            _desc.text = [NSString stringWithFormat:@"chiniupa"];
            break;
        case 4:
            _imageView.image = [UIImage imageNamed:@"danteng"];
            _seqNum.text = [NSString stringWithFormat:@"%d/5", _picSeq];
            _desc.text = [NSString stringWithFormat:@"danteng"];
            break;
        case 5:
            _imageView.image = [UIImage imageNamed:@"wangba"];
            _seqNum.text = [NSString stringWithFormat:@"%d/5", _picSeq];
            _desc.text = [NSString stringWithFormat:@"wangba"];
            break;
        default:
            break;
        
    }
    _nextBtn.enabled = (_picSeq == 5 ? NO : YES);
    _prevBtn.enabled = (_picSeq == 1 ? NO : YES);
}

@end

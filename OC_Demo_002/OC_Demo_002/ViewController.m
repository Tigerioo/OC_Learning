//
//  ViewController.m
//  OC_Demo_002
//
//  Created by 林国强 on 15/3/13.
//  Copyright (c) 2015年 lynn. All rights reserved.
//
#define IMGICON @"image"
#define IMGDESC @"desc"

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *imageArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self changeData];//改变图片值
    
}

-(NSArray *) imageArray{
    if (_imageArray == nil) {
//        NSMutableDictionary *image1 = [NSMutableDictionary dictionary];
//        image1[IMGICON] = @"biaoqingdi";
//        image1[IMGDESC] = @"biaoqingdi";
//        
//        NSMutableDictionary *image2 = [NSMutableDictionary dictionary];
//        image2[IMGICON] = @"bingli";
//        image2[IMGDESC] = @"bingli";
//        
//        NSMutableDictionary *image3 = [NSMutableDictionary dictionary];
//        image3[IMGICON] = @"chiniupa";
//        image3[IMGDESC] = @"chiniupa";
//        
//        NSMutableDictionary *image4 = [NSMutableDictionary dictionary];
//        image4[IMGICON] = @"danteng";
//        image4[IMGDESC] = @"danteng";
//        
//        NSMutableDictionary *image5 = [NSMutableDictionary dictionary];
//        image5[IMGICON] = @"wangba";
//        image5[IMGDESC] = @"wangba";
//        
//        NSMutableDictionary *image6 = [NSMutableDictionary dictionary];
//        image6[IMGICON] = @"wangba";
//        image6[IMGDESC] = @"Tttttttttttt";
        
        NSBundle *bundle = [NSBundle mainBundle];//一个NSBundle代表一个文件夹
        NSString *path = [bundle pathForResource:@"imageData" ofType:@"plist"];
        
        _imageArray = [NSArray arrayWithContentsOfFile:path];
    }
    
    return _imageArray;
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
    
            
    NSMutableDictionary *dict = self.imageArray[_picSeq];//获取对应的字典数据
    _seqNum.text = [NSString stringWithFormat:@"%d/%lu", _picSeq + 1, self.imageArray.count];//设置标题图片序号
    _imageView.image = [UIImage imageNamed:dict[IMGICON]];//设置图片
    _desc.text = dict[IMGDESC];//设置图片描述
    
//    _nextBtn.enabled = (_picSeq >= _imageArray.count-1 ? NO : YES);
//    _prevBtn.enabled = (_picSeq <= 0 ? NO : YES);
    
    _nextBtn.enabled = _picSeq != _imageArray.count-1;
    _prevBtn.enabled = _picSeq != 0;
    
}

@end

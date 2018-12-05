//
//  ViewController.m
//  TomCat
//
//  Created by 林国强 on 15/3/15.
//  Copyright (c) 2015年 lynn. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *tom;

- (IBAction)cymbal;

- (IBAction)head;

- (IBAction)drink;

- (IBAction)eat;

- (IBAction)fart;

- (IBAction)pie;

- (IBAction)scratch;

- (IBAction)stomach;

- (IBAction)footright;

- (IBAction)footleft;

- (IBAction)angry;


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

#pragma cymbal
- (IBAction)cymbal {
    
    [self runAnimateWithCount:13 name:@"cymbal"];
    
}

- (IBAction)head {
    [self runAnimateWithCount:81 name:@"knockout"];
}

- (IBAction)drink {
    [self runAnimateWithCount:81 name:@"drink"];
}

- (IBAction)eat {
    [self runAnimateWithCount:40 name:@"eat"];
}

- (IBAction)fart {
    [self runAnimateWithCount:28 name:@"fart"];
}

- (IBAction)pie {
    [self runAnimateWithCount:24 name:@"pie"];
}

- (IBAction)scratch {
    [self runAnimateWithCount:56 name:@"scratch"];
}

- (IBAction)stomach {
    [self runAnimateWithCount:34 name:@"stomach"];
}

- (IBAction)footright {
    [self runAnimateWithCount:30 name:@"footRight"];
}

- (IBAction)footleft {
    [self runAnimateWithCount:30 name:@"footLeft"];
}

- (IBAction)angry {
    [self runAnimateWithCount:26 name:@"angry"];
}

/**
    播放动画
 */
-(void)runAnimateWithCount:(int)count name:(NSString *)pixName {
    if (self.tom.isAnimating) return;
    
    //1. 定义一个数组
    NSMutableArray *images = [NSMutableArray array];
    
    //2. 设置数组里面的每一个图片item
    for (int i=0; i < count; i++) {
        NSString *imageName = [NSString stringWithFormat:@"%@_%02d.jpg", pixName, i];
        //imageNamed:这种方式可以加载缓存，占用内存较大
//        UIImage * image = [UIImage imageNamed:imageName];
        
        //imageWithContentsOfFile 无缓存 ，File带入全路径
        NSBundle *myBundle = [NSBundle mainBundle];
        NSString *path = [myBundle pathForResource:imageName ofType:nil];
        UIImage * image = [UIImage imageWithContentsOfFile:path];
        
        [images addObject:image];
    }
    
    //将数组赋值给tom
    self.tom.animationImages = images;
    
    //设置动画执行次数 为 1次
    self.tom.animationRepeatCount = 1;
    
    //设置动画持续时间
    self.tom.animationDuration = images.count * 0.1;
    
    //3.开始动画
    [self.tom startAnimating];
    
    //动画结束后1秒清除缓存
    CGFloat delay = self.tom.animationDuration + 1.0;
//    [self performSelector:@selector(clearCache) withObject:nil afterDelay:delay];
    [self.tom performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:delay];
    
}

//-(void)clearCache{
//    self.tom.animationImages = nil;
//}

@end

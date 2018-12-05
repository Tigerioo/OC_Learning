//
//  ViewController.m
//  ChargeBill
//
//  Created by 林国强 on 4/9/16.
//  Copyright © 2016 lynn. All rights reserved.
//

#import "ViewController.h"
#import "BcViewController.h"

@interface ViewController ()<BcViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *labelT;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.labelT setText:@"ttttt"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}

- (void)displayNewValue:(BcViewController *)bvc getValue:(NSString *)value{
    NSLog(@"-!!!!%@", value);
    [self.labelT setText:value];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    BcViewController *vc = segue.destinationViewController;
    vc.delegate = self;
}

@end

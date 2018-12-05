//
//  BcViewController.m
//  ChargeBill
//
//  Created by 林国强 on 4/11/16.
//  Copyright © 2016 lynn. All rights reserved.
//

#import "BcViewController.h"

@interface BcViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;

- (IBAction)saveBtn:(id)sender;

@end

@implementation BcViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)saveBtn:(id)sender {
    NSLog(@"t--------------------");
    [self.navigationController popViewControllerAnimated:YES];
    if([self.delegate respondsToSelector:@selector(displayNewValue:getValue:)]){
        NSLog(@"t-----------sdfsdf---------");
        [self.delegate displayNewValue:self getValue:_textField.text];
    }
}
@end

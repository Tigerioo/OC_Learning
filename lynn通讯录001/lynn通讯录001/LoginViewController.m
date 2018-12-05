//
//  LoginViewController.m
//  lynn通讯录001
//
//  Created by 林国强 on 15/6/5.
//  Copyright (c) 2015年 lynn. All rights reserved.
//

#import "LoginViewController.h"
#import "MBProgressHUD+MJ.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usrTextField;
@property (weak, nonatomic) IBOutlet UITextField *pwdTextField;
@property (weak, nonatomic) IBOutlet UISwitch *rmbSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *autoLoginSwitch;
@property (weak, nonatomic) IBOutlet UIButton *login;


- (IBAction)loginBtn;
- (IBAction)rmbSwitchBtn;
- (IBAction)autoLoginSwitchBtn;


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加监听器
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.usrTextField];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.pwdTextField];
    
//    if (self.autoLoginSwitch.isOn) {
//        //验证账户是否等于 lgq， 密码是否是123
//        if ([self.usrTextField.text isEqualToString:@"lgq"] && [self.pwdTextField.text isEqualToString:@"123"]) {
//            
//            //添加遮板
//            [MBProgressHUD showMessage:@"正在登陆"];
//            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//                
//                //取消遮板
//                [MBProgressHUD hideHUD];
//                
//                [MBProgressHUD showSuccess:@"登陆成功！"];
//                [self performSegueWithIdentifier:@"login2Contact" sender:nil];
//            });
//            
//        }else {
//            [MBProgressHUD showError:@"用户名或密码错误!"];
//        }
//    }
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void) textChange {
    self.login.enabled = self.usrTextField.text.length && self.pwdTextField.text.length;
}

/**
 * 登陆事件
 **/
- (IBAction)loginBtn {
   //验证账户是否等于 lgq， 密码是否是123
    if ([self.usrTextField.text isEqualToString:@"lgq"] && [self.pwdTextField.text isEqualToString:@"123"]) {
        
        //添加遮板
        [MBProgressHUD showMessage:@"正在登陆"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            //取消遮板
            [MBProgressHUD hideHUD];
            
            [MBProgressHUD showSuccess:@"登陆成功！"];
            [self performSegueWithIdentifier:@"login2Contact" sender:nil];
        });
        
    }else {
        [MBProgressHUD showError:@"用户名或密码错误!"];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    UIViewController *contactVc = segue.destinationViewController;
    contactVc.title = [NSString stringWithFormat:@"%@的联系人列表", self.usrTextField.text];
}

- (IBAction)rmbSwitchBtn {
    if (!self.rmbSwitch.isOn) {
        [self.autoLoginSwitch setOn:NO animated:YES];
    }
}

- (IBAction)autoLoginSwitchBtn {
    if (self.autoLoginSwitch.isOn) {
        [self.rmbSwitch setOn:YES animated:YES];
    }
}
@end

//
//  EditViewController.m
//  lynn通讯录001
//
//  Created by 林国强 on 15/6/7.
//  Copyright (c) 2015年 lynn. All rights reserved.
//

#import "EditViewController.h"
#import "ContactModel.h"

@interface EditViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;
- (IBAction)save;
- (IBAction)edit:(id)sender;

@end

@implementation EditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.nameField];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.phoneField];
    
    self.nameField.text = _contact.name;
    self.phoneField.text = _contact.phone;
}

- (void) dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void) textChange{
    self.saveBtn.enabled = (self.nameField.text.length && self.phoneField.text.length);
}

/**
 *  保存按钮
 **/
- (IBAction)save {
    
    //回到联系人列表
    [self.navigationController popViewControllerAnimated:YES];
    
    //设置代理触发条件
    if ([self.delegate respondsToSelector:@selector(editViewController:updateContact:)]) {
        _contact.name = self.nameField.text;
        _contact.phone = self.phoneField.text;
        [self.delegate editViewController:self updateContact:_contact];
    }
}

- (IBAction)edit:(UINavigationItem *)sender {
    if ([sender.title isEqualToString:@"编辑"]) {
        self.nameField.enabled = YES;
        self.phoneField.enabled = YES;
        self.saveBtn.hidden = NO;
        sender.title = @"取消";
        [self.phoneField becomeFirstResponder];
        
    } else {
        self.nameField.enabled = NO;
        self.phoneField.enabled = NO;
        self.saveBtn.hidden = YES;
        sender.title = @"编辑";
        [self.view resignFirstResponder];
        //取消的时候还原数据
        self.nameField.text = _contact.name;
        self.phoneField.text = _contact.phone;
    }
}


@end

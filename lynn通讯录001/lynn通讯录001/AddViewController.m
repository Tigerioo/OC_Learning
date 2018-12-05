//
//  AddViewController.m
//  lynn通讯录001
//
//  Created by 林国强 on 15/6/6.
//  Copyright (c) 2015年 lynn. All rights reserved.
//

#import "AddViewController.h"
#import "ContactModel.h"

@interface AddViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;
- (IBAction)add;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.nameField];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.phoneField];
}

- (void) dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void) textChange{
    self.addBtn.enabled = (self.nameField.text.length && self.phoneField.text.length);
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.nameField becomeFirstResponder];
}

- (IBAction)add {
    [self.navigationController popViewControllerAnimated:YES];
    
    if ([self.delegate respondsToSelector:@selector(addViewController:addContact:)]){
        ContactModel *contact = [[ContactModel alloc] init];
        contact.name = self.nameField.text;
        contact.phone = self.phoneField.text;
        
        [self.delegate addViewController:self addContact:contact];
    }
}
@end

//
//  EditViewController.h
//  lynn通讯录001
//
//  Created by 林国强 on 15/6/7.
//  Copyright (c) 2015年 lynn. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ContactModel, EditViewController;

@protocol EditViewControllerDelegate<NSObject>

@optional
- (void)editViewController:(EditViewController *)editVc updateContact:(ContactModel *)contact;

@end

@interface EditViewController : UIViewController

@property (nonatomic, strong) ContactModel *contact;
@property (nonatomic, weak) id<EditViewControllerDelegate> delegate;//设置代理属性

@end

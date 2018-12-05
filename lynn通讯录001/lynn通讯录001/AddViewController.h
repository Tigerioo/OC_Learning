//
//  AddViewController.h
//  lynn通讯录001
//
//  Created by 林国强 on 15/6/6.
//  Copyright (c) 2015年 lynn. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AddViewController, ContactModel;

@protocol AddViewControllerDelegate<NSObject>

@optional
- (void) addViewController: (AddViewController *)addVc addContact:(ContactModel *)contact;

@end

@interface AddViewController : UIViewController

//设置代理的属性
@property (nonatomic, weak) id<AddViewControllerDelegate> delegate;

@end

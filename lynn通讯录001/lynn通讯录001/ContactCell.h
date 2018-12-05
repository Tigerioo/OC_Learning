//
//  ContactCell.h
//  lynn通讯录001
//
//  Created by 林国强 on 15/6/7.
//  Copyright (c) 2015年 lynn. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ContactModel;

@interface ContactCell : UITableViewCell

@property (nonatomic, strong) ContactModel* contact;
+ (instancetype) cellWithTableView:(UITableView *)tableView;

@end

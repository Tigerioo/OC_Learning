//
//  TgsTableViewCell.h
//  团购数据001
//
//  Created by 林国强 on 15/5/24.
//  Copyright (c) 2015年 lynn. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TgsModel;

@interface TgsTableViewCell : UITableViewCell

/**
 * 团购模型
 **/
@property (nonatomic, strong) TgsModel *tgs;

/**
 * 初始化cell
 **/
+ (instancetype) tgsWithTableView:(UITableView *)tableView;

@end

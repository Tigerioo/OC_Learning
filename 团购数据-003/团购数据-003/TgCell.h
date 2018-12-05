//
//  TgCell.h
//  团购数据-003
//
//  Created by 林国强 on 15/5/25.
//  Copyright (c) 2015年 lynn. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TgModel;

@interface TgCell : UITableViewCell

+ (instancetype) tgWithTableView:(UITableView *)tableView;
@property (nonatomic, strong) TgModel *tg;

@end

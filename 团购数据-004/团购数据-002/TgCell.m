//
//  TgCell.m
//  团购数据-002
//
//  Created by 林国强 on 15/5/24.
//  Copyright (c) 2015年 lynn. All rights reserved.
//

#import "TgCell.h"
#import "TgModel.h"

@interface TgCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleView;
@property (weak, nonatomic) IBOutlet UILabel *priceView;
@property (weak, nonatomic) IBOutlet UILabel *buyCountView;

@end

@implementation TgCell

+ (instancetype)tgWithTableView:(UITableView *)tableView{
    static NSString *ID = @"tg";
    
    TgCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"tgCell" owner:nil options:nil] lastObject];
    }
    
    return cell;
}

- (void) setTg:(TgModel *)tg{
    _tg = tg;
    
    self.iconView.image = [UIImage imageNamed:tg.icon];
    self.titleView.text = tg.title;
    self.priceView.text = [NSString stringWithFormat:@"￥%@", tg.price];
    self.buyCountView.text = [NSString stringWithFormat:@"%@人已购买", tg.buyCount];
    
}

@end

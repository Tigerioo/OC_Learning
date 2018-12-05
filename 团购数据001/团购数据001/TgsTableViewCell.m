//
//  TgsTableViewCell.m
//  团购数据001
//
//  Created by 林国强 on 15/5/24.
//  Copyright (c) 2015年 lynn. All rights reserved.
//

#import "TgsTableViewCell.h"
#import "TgsModel.h"

@interface TgsTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *cellImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleView;
@property (weak, nonatomic) IBOutlet UILabel *priceView;
@property (weak, nonatomic) IBOutlet UILabel *buyCountView;

@end


@implementation TgsTableViewCell

+ (instancetype)tgsWithTableView:(UITableView *)tableView{
    static NSString *ID = @"tgs";
    
    TgsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"tgs_cell" owner:nil options:nil] lastObject];
    }
    return cell;
}

- (void) setTgs:(TgsModel *)tgs{
    _tgs = tgs;
    
    self.cellImageView.image = [UIImage imageNamed: tgs.icon];
    self.titleView.text = tgs.title;
    self.priceView.text = [NSString stringWithFormat:@"￥%@", tgs.price];
    self.buyCountView.text = [NSString stringWithFormat:@"%@人已购买", tgs.buyCount];
}

@end

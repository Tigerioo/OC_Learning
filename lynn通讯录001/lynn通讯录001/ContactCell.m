//
//  ContactCell.m
//  lynn通讯录001
//
//  Created by 林国强 on 15/6/7.
//  Copyright (c) 2015年 lynn. All rights reserved.
//

#import "ContactCell.h"
#import "ContactModel.h"

@interface ContactCell()

@property (nonatomic, weak) UIView *devider;

@end

@implementation ContactCell

- (void)setContact:(ContactModel *)contact{
    _contact = contact;
    self.textLabel.text = contact.name;
    self.detailTextLabel.text = contact.phone;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ID = @"contact";
    return [tableView dequeueReusableCellWithIdentifier:ID];
}

- (void)awakeFromNib {
    // Initialization code
    //设置底部分割线的UIView
    UIView *devider = [[UIView alloc] init];
    devider.backgroundColor = [UIColor blackColor];
    devider.alpha = 0.3;
    
    //加入当前的contentView
    [self.contentView addSubview:devider];
    self.devider = devider;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    //设置分割线的frame
    CGFloat deviderX = 5;
    CGFloat deviderH = 1;
    CGFloat deviderY = self.frame.size.height - deviderH;
    CGFloat deviderW = self.frame.size.width - 10;
    self.devider.frame = CGRectMake(deviderX, deviderY, deviderW, deviderH);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

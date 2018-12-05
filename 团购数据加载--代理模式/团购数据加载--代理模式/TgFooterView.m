//
//  TgFooterView.m
//  团购数据加载--代理模式
//
//  Created by 林国强 on 15/5/24.
//  Copyright (c) 2015年 lynn. All rights reserved.
//

#import "TgFooterView.h"

@interface TgFooterView()
@property (weak, nonatomic) IBOutlet UIButton *loadBtn;
@property (weak, nonatomic) IBOutlet UIView *loadView;
- (IBAction)loadBtnClick;

@end

@implementation TgFooterView

+ (instancetype)footerView {
    return [[[NSBundle mainBundle] loadNibNamed:@"tgFooterView" owner:nil options:nil] lastObject];
}



- (IBAction)loadBtnClick {
    
    self.loadBtn.hidden = YES;
    self.loadView.hidden = NO;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if ([self.delegate respondsToSelector:@selector(tgFooterViewLoadMoreData:)]){
            [self.delegate tgFooterViewLoadMoreData:self];
        }
        self.loadBtn.hidden = NO;
        self.loadView.hidden = YES;
    });
    
}
@end

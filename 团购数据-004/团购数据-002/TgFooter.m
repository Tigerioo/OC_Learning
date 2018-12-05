//
//  TgFooter.m
//  团购数据-002
//
//  Created by 林国强 on 15/5/26.
//  Copyright (c) 2015年 lynn. All rights reserved.
//

#import "TgFooter.h"

@interface TgFooter()
@property (weak, nonatomic) IBOutlet UIButton *loadBtn;
@property (weak, nonatomic) IBOutlet UIView *loadingView;
- (IBAction)loadBtnClick;

@end

@implementation TgFooter

+ (instancetype)tgFooter{
    return [[[NSBundle mainBundle] loadNibNamed:@"TgFooter" owner:nil options:nil] lastObject];
}

- (IBAction)loadBtnClick {
    self.loadBtn.hidden = YES;
    self.loadingView.hidden = NO;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if ([self.delegate respondsToSelector:@selector(tgFooterLoadingMoreData:)]) {
            [self.delegate tgFooterLoadingMoreData:self];
            self.loadBtn.hidden = NO;
            self.loadingView.hidden = YES;
        }
    });
}
@end

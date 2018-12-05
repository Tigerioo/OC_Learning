//
//  TgFooterView.m
//  团购数据-003
//
//  Created by 林国强 on 15/5/25.
//  Copyright (c) 2015年 lynn. All rights reserved.
//

#import "TgFooterView.h"

@interface TgFooterView()
@property (weak, nonatomic) IBOutlet UIButton *loadBtn;
@property (weak, nonatomic) IBOutlet UIView *loadingView;
- (IBAction)loadBtnClick;

@end

@implementation TgFooterView

+ (instancetype)tgFooterView{
    return [[[NSBundle mainBundle] loadNibNamed:@"TgFooterView" owner:nil options:nil] lastObject];
}

- (IBAction)loadBtnClick {
    
    NSLog(@"-------");
    self.loadBtn.hidden = YES;
    self.loadingView.hidden = NO;

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if ([self.delegate respondsToSelector:@selector(tgFooterViewLoadingData:)]) {
            [self.delegate tgFooterViewLoadingData:self];
        }
        
        self.loadBtn.hidden = NO;
        self.loadingView.hidden = YES;
    });
    
}
@end

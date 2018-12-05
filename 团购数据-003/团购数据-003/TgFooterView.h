//
//  TgFooterView.h
//  团购数据-003
//
//  Created by 林国强 on 15/5/25.
//  Copyright (c) 2015年 lynn. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TgFooterView;

@protocol TgFooterViewDelegate <NSObject>

@optional
- (void) tgFooterViewLoadingData: (TgFooterView *) tgFooterView;

@end

@interface TgFooterView : UIView

+ (instancetype) tgFooterView;

@property (nonatomic, weak) id<TgFooterViewDelegate> delegate;

@end

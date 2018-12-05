//
//  TgFooter.h
//  团购数据-002
//
//  Created by 林国强 on 15/5/26.
//  Copyright (c) 2015年 lynn. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TgFooter;

@protocol TgFooterViewDelegate<NSObject>

@optional
- (void) tgFooterViewLoadMoreData:(TgFooter *)tgFooter;

@end

@interface TgFooter : UIView

+ (instancetype) tgFooter;

@property (nonatomic, weak) id<TgFooterViewDelegate> delegate;

@end

//
//  TgFooter.h
//  团购数据-002
//
//  Created by 林国强 on 15/5/26.
//  Copyright (c) 2015年 lynn. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TgFooter;

/**
 * 定义一个协议
 **/
@protocol TgFooterDelegate<NSObject>

@optional

- (void) tgFooterLoadingMoreData:(TgFooter *)tgFooter;

@end

@interface TgFooter : UIView

@property (nonatomic, weak) id<TgFooterDelegate> delegate;

+ (instancetype) tgFooter;

@end

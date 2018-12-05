//
//  TgModel.h
//  团购数据-003
//
//  Created by 林国强 on 15/5/25.
//  Copyright (c) 2015年 lynn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TgModel : UIView

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, copy) NSString *buyCount;
@property (nonatomic, copy) NSString *icon;

+ (instancetype) tgWithDict:(NSDictionary *)dict;
- (instancetype) initWithDict:(NSDictionary *)dict;

@end

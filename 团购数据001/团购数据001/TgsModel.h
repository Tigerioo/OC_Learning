//
//  TgsModel.h
//  团购数据001
//
//  Created by 林国强 on 15/5/24.
//  Copyright (c) 2015年 lynn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TgsModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *buyCount;
@property (nonatomic, copy) NSString *price;

+ (instancetype) tgsWithDict:(NSDictionary *)dict;
- (instancetype) initWithDict:(NSDictionary *)dict;

@end

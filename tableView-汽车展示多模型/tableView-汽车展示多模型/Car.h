//
//  Car.h
//  tableView-汽车展示多模型
//
//  Created by 林国强 on 15/5/23.
//  Copyright (c) 2015年 lynn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject

@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *name;

+ (instancetype) carWithDict:(NSDictionary *)dict;
- (instancetype) initWithDict:(NSDictionary *)dict;

@end

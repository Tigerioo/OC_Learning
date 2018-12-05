//
//  Car.m
//  tableView-汽车展示多模型
//
//  Created by 林国强 on 15/5/23.
//  Copyright (c) 2015年 lynn. All rights reserved.
//

#import "Car.h"

@implementation Car

+ (instancetype) carWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}
- (instancetype) initWithDict:(NSDictionary *)dict{
    if (self = [super init]){
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

@end

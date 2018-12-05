//
//  CarGroup.m
//  tableView-数据刷新002
//
//  Created by 林国强 on 15/5/23.
//  Copyright (c) 2015年 lynn. All rights reserved.
//

#import "CarGroup.h"
#import "Car.h"

@implementation CarGroup

+ (instancetype) groupWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}
- (instancetype) initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        //设置标题
        self.title = dict[@"title"];
        
        //设置cars
        NSArray *dictArray = dict[@"cars"];
        NSMutableArray *carsArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            Car *car = [Car carWithDict:dict];
            [carsArray addObject:car];
        }
        self.cars = carsArray;
    }
    return self;
}

@end

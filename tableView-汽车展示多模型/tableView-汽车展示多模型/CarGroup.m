//
//  CarGroup.m
//  tableView-汽车展示多模型
//
//  Created by 林国强 on 15/5/23.
//  Copyright (c) 2015年 lynn. All rights reserved.
//

#import "CarGroup.h"
#import "Car.h"

@implementation CarGroup

+ (instancetype) groupWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}
- (instancetype) initWithDict:(NSDictionary *)dict{
    if (self = [super init]){
        //获取Car
        self.title = dict[@"title"];
        NSArray *dictArray = dict[@"cars"];
        NSMutableArray *carsArray = [NSMutableArray array];
        
        for (NSDictionary *dict in dictArray){
            Car *car = [Car carWithDict:dict];
            [carsArray addObject:car];
        }
        
        //将Car加入Group
        self.cars = carsArray;
    }
    return self;
}

@end

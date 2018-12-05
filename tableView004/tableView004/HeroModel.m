//
//  HeroModel.m
//  tableView004
//
//  Created by 林国强 on 15/5/22.
//  Copyright (c) 2015年 lynn. All rights reserved.
//

#import "HeroModel.h"

@implementation HeroModel

+(instancetype)heroWithDict:(NSDictionary *) dict{
    return [[self alloc] initWithDict:dict];
}

-(instancetype)initWithDict:(NSDictionary *) dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

@end

//
//  TgModel.m
//  团购数据-003
//
//  Created by 林国强 on 15/5/25.
//  Copyright (c) 2015年 lynn. All rights reserved.
//

#import "TgModel.h"

@implementation TgModel

+ (instancetype)tgWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

@end

//
//  HeroModel.h
//  tableView006-reuseable
//
//  Created by 林国强 on 15/5/23.
//  Copyright (c) 2015年 lynn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HeroModel : NSObject

@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *intro;
@property(nonatomic, copy) NSString *icon;

+ (instancetype) heroWithDict: (NSDictionary *)dict;
- (instancetype) initWithDict: (NSDictionary *)dict;

@end

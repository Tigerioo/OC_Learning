//
//  main.m
//  NiMingDuiXiang
//
//  Created by 林国强 on 15/2/25.
//  Copyright (c) 2015年 lynn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Iphone.h"

int main(int argc, const char * argv[]) {
    
    Iphone *p = [Iphone new];
    p->_size = 5;
    [p aboutMyPhone];
    return 0;
}

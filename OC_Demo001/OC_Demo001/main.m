//
//  main.m
//  OC_Demo001
//
//  Created by 林国强 on 15/2/23.
//  Copyright (c) 2015年 lynn. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    IColorBLACK,
    IColorWhite
} IColor;

@interface Iphone : NSObject{
    @public
    int _cpu;// CPU
    int _size;// 大小
    IColor _iColor;// 颜色
}

@end

@implementation Iphone

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Iphone *p;
        p = [Iphone new];
        
        p->_cpu = 2;
        p->_size = 3;
        p->_iColor = IColorBLACK;
    }
    return 0;
}

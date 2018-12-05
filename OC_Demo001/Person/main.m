//
//  main.m
//  Person
//
//  Created by 林国强 on 15/2/24.
//  Copyright (c) 2015年 lynn. All rights reserved.
//

#import <Foundation/Foundation.h>

 /*
 要求：
 * 类名、属性名、属性类型、方法名、方法参数、方法返回值自拟
 * 自己写main函数测试设计是否合理
 
 1.设计一个”狗“类
 1> 属性
 * 颜色
 * 速度（单位是m/s）
 * 性别
 * 体重（单位是kg）
 
 2> 行为
 * 吃：每吃一次，体重增加0.5kg，输出吃完后的体重
 * 吠（叫）：输出所有的属性
 * 跑：每跑一次，体重减少0.5kg，输出速度和跑完后的体重
 * 比较颜色：跟别的狗比较颜色，如果一样，返回YES，不一样，返回NO
 * 比较速度：跟别的狗比较速度，返回速度差（自己的速度 - 其他狗的速度）
 */

typedef enum {
    kColorBlack,
    kColorWhite
} IColor;

typedef enum {
    kSexMan,
    kSexWoman
} ISex;

@interface Dog : NSObject{
    IColor dogColor;// 狗的颜色
    int _speed;// 狗的速度
    ISex dogSex;// 狗的性别
    double _weight;// 狗的体重
}

//吃
- (void)eat;

//跑
- (void)run;

//咆哮
- (void)peak;

//比较颜色
- (BOOL)isSameColor:(Dog *)other;

//比较速度
- (int)compareSpeed:(Dog *)other;

@end

@implementation Dog

- (void)eat {
    _weight += 0.5;
    NSLog(@"Dog's weight is %.1lf", _weight);
}



@end

int main(int argc, const char * argv[]) {
    
    return 0;
}

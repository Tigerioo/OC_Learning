//: Playground - noun: a place where people can play

import UIKit


    //定义时间格式器类
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //将记录的日期转成date类型
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSDate *date = [formatter dateFromString:mile.startTime];
    //只按天设置格式
    [formatter setDateFormat:@"yyyy-MM-dd"];

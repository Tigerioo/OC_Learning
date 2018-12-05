//
//  ViewController.m
//  SQLite-001
//
//  Created by 林国强 on 15/5/27.
//  Copyright (c) 2015年 lynn. All rights reserved.
//

#import "ViewController.h"
#import <sqlite3.h>

@interface ViewController ()
{
    sqlite3 *_db;//整个数据库，整个数据库实例
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //获取沙盒中的数据库文件名
    NSString *filename = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"student.sqlite"];
    NSLog(@"%@", filename);
    
    
    int result = sqlite3_open(filename.UTF8String, &_db);
    if (result == SQLITE_OK) {
        NSLog(@"打开数据库成功！");
        const char * createSql = "create table if not exists t_student(id integer primary key autoincrement, name text, age integer)";
        char *errormsg = NULL;
        //建表
        result = sqlite3_exec(_db, createSql, NULL, NULL, &errormsg);
        if (result == SQLITE_OK) {
            NSLog(@"建表成功%s", createSql);
        } else {
            NSLog(@"建表失败%s", errormsg);
        }
        
    }else {
        NSLog(@"打开数据库失败！");
    }
}

@end

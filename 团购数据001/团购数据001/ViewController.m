//
//  ViewController.m
//  团购数据001
//
//  Created by 林国强 on 15/5/24.
//  Copyright (c) 2015年 lynn. All rights reserved.
//

#import "ViewController.h"
#import "TgsModel.h"
#import "TgsTableViewCell.h"

@interface ViewController () <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *tgsModels;
@end

@implementation ViewController

/**
 * 初始化数据
 **/
- (NSArray *) tgsModels{
    if (_tgsModels == nil){
        NSString *path = [[NSBundle mainBundle] pathForResource:@"tgs.plist" ofType:nil];
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *tgsArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            TgsModel *tgs = [TgsModel tgsWithDict:dict];
            [tgsArray addObject:tgs];
        }
        _tgsModels = tgsArray;
    }
    return _tgsModels;
}

/**
 * 有多少行cell
 **/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.tgsModels.count;
}

/**
 * 每行显示的内容
 **/
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //初始化自定义Cell
    TgsTableViewCell *cell = [TgsTableViewCell tgsWithTableView:tableView];
    
    //赋值数据
    cell.tgs = self.tgsModels[indexPath.row];
    
    return cell;
}

/**
 * 隐藏状态栏
 **/
- (BOOL)prefersStatusBarHidden{
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //设置tableView的高度
    self.tableView.rowHeight = 80;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

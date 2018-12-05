//
//  ViewController.m
//  TableViewDemo-001
//
//  Created by 林国强 on 15/5/5.
//  Copyright (c) 2015年 lynn. All rights reserved.
//

#import "ViewController.h"
#import "CarGroup.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *carGroups;

@end

@implementation ViewController




- (NSArray *) carGroups{
    if(_carGroups == nil){
        
        //德系品牌
        CarGroup *car1 = [[CarGroup alloc] init];
        car1.name = @"德系品牌";
        car1.desc = @"坚硬耐操！";
        car1.cars = @[@"奔驰", @"宝马", @"奥迪"];
        
        //日系品牌
        CarGroup *car2 = [[CarGroup alloc] init];
        car2.name = @"日系品牌";
        car2.desc = @"皮薄车轻！";
        car2.cars = @[@"本田", @"丰田"];
        
        //欧系品牌
        CarGroup *car3 = [[CarGroup alloc] init];
        car3.name = @"德系品牌";
        car3.desc = @"高达上！";
        car3.cars = @[@"法拉利", @"兰博基尼", @"劳斯莱斯", @"大众", @"奔驰", @"奥迪", @"宝马", @"保时捷"];
        
        _carGroups = @[car1, car2, car3];
    }
    return _carGroups;
}

#pragma mark 数据源方法

/**
 * 一共有多少组数据
 **/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSLog(@"count = %lu" , self.carGroups.count);
    return self.carGroups.count;
//    return 2;
}

/**
 * 第section组有多少行
 **/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    CarGroup *carGroup = self.carGroups[section];
    return carGroup.cars.count;
//    return 2;
}

/**
 * 每一行显示什么样的内容
 **/
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    CarGroup *carGroup = self.carGroups[indexPath.section];
    
    cell.textLabel.text = carGroup.cars[indexPath.row];
    
    return cell;
}

/**
 * 设置标题头
 **/
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    CarGroup *car = self.carGroups[section];
    return car.name;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    CarGroup *car = self.carGroups[section];
    return car.desc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tableView.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

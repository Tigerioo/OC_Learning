//
//  ViewController.m
//  tableView-汽车展示多模型
//
//  Created by 林国强 on 15/5/23.
//  Copyright (c) 2015年 lynn. All rights reserved.
//

#import "ViewController.h"
#import "Car.h"
#import "CarGroup.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *carGroup;
@end

@implementation ViewController

- (NSArray *) carGroup {
    if (_carGroup == nil){
        NSString *path = [[NSBundle mainBundle] pathForResource:@"cars_total.plist" ofType:nil];
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *groupsArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            CarGroup *carGroup = [CarGroup groupWithDict:dict];
            [groupsArray addObject:carGroup];
        }
        _carGroup = groupsArray;
    }
    return _carGroup;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.carGroup.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    CarGroup *carGroup = self.carGroup[section];
    return carGroup.cars.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //先定义一个静态ID，cell的缓存池编号
    static NSString *ID = @"cars";
    
    //先从缓存池中获取
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    //设置数据
    CarGroup *carGroup = self.carGroup[indexPath.section];
    Car *car = carGroup.cars[indexPath.row];
    
    cell.textLabel.text = car.name;
    cell.imageView.image = [UIImage imageNamed:car.icon];
    
    return cell;
}

/**
 * 添加组的标题
 **/
- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    CarGroup *carGroup = self.carGroup[section];
    return carGroup.title;
}

/**
 * 隐藏状态栏
**/
- (BOOL)prefersStatusBarHidden{
    return YES;
}

/**
 * 生成首字母的索引
 *
**/
- (NSArray *) sectionIndexTitlesForTableView:(UITableView *)tableView{
    return [self.carGroup valueForKeyPath:@"title"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

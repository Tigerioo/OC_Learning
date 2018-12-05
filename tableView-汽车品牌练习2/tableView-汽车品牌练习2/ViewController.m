//
//  ViewController.m
//  tableView-汽车品牌练习2
//
//  Created by 林国强 on 15/5/23.
//  Copyright (c) 2015年 lynn. All rights reserved.
//

#import "ViewController.h"
#import "Car.h"
#import "CarGroup.h"

@interface ViewController () <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *groups;
@end

@implementation ViewController

/**
 * 初始化group数据
 *
**/
- (NSArray *) groups{
    if (_groups == nil){
        //加载plist文件
        NSString *path = [[NSBundle mainBundle] pathForResource:@"cars_total.plist" ofType:nil];
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *carsArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray){
            CarGroup *group = [CarGroup groupWithDict:dict];
            [carsArray addObject:group];
        }
        _groups = carsArray;
        
    }
    return _groups;
}

/**
 *  隐藏状态栏
 **/
- (BOOL)prefersStatusBarHidden{
    return YES;
}

/**
 * 总共多少组
 **/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.groups.count;
}

/**
 * 每一组总共多少行
 **/
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    CarGroup *group = self.groups[section];
    return group.cars.count;
}

/**
 * 每行要显示的内容
 **/
- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //cell缓存池的唯一标识
    static NSString *ID = @"cars";
    
    //先从缓存池拿取cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    //如果缓存池为空，则初始化一个cell
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    
    //拿到cell后,进行数据初始化
    CarGroup *group = self.groups[indexPath.section];
    Car *car = group.cars[indexPath.row];
    cell.textLabel.text = car.name;
    cell.imageView.image = [UIImage imageNamed:car.icon];
    
    return cell;
}

/**
 * 显示每个分组的标题
 **/
- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    CarGroup *group = self.groups[section];
    return group.title;
}

/**
 * 显示右边的快捷索引栏
 **/
- (NSArray *) sectionIndexTitlesForTableView:(UITableView *)tableView {
    return [self.groups valueForKeyPath:@"title"];
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

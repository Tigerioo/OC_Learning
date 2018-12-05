//
//  ViewController.m
//  tableView-数据刷新002
//
//  Created by 林国强 on 15/5/23.
//  Copyright (c) 2015年 lynn. All rights reserved.
//

#import "ViewController.h"
#import "Car.h"
#import "CarGroup.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *groups;
@end

@implementation ViewController

- (NSArray *) groups {
    if (_groups == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"cars_total.plist" ofType:nil];
        
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *groupsArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray){
            CarGroup *carGroup = [CarGroup groupWithDict:dict];
            [groupsArray addObject:carGroup];
        }
        _groups = groupsArray;
    }
    return _groups;
}

/**
 * 总共有多少组数据
 **/
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return self.groups.count;
}

/**
 * 每组有多少行
 **/
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    CarGroup *group = self.groups[section];
    return group.cars.count;
}

/**
 * 每行要显示的内容
 **/
- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //定义cell缓存池的唯一标识
    static NSString *ID = @"cars";
    
    //从缓存池中获取cell
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    CarGroup *group = self.groups[indexPath.section];
    Car *car = group.cars[indexPath.row];
    cell.textLabel.text = car.name;
    cell.imageView.image = [UIImage imageNamed:car.icon];
    
    return cell;
}

- (BOOL)prefersStatusBarHidden{
    return YES;
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    CarGroup *group = self.groups[section];
    return group.title;
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return [self.groups valueForKeyPath:@"title"];
}

long section ;

#pragma 点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CarGroup *group = self.groups[indexPath.section];
    Car *car = group.cars[indexPath.row];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"数据展示" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确认", nil];
    alertView.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alertView textFieldAtIndex:0].text = car.name;
    alertView.tag = indexPath.row;
    section = indexPath.section;
    [alertView show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) return;
    
    NSString *result = [alertView textFieldAtIndex:0].text;
    
    CarGroup *group = self.groups[section];
    Car *car = group.cars[alertView.tag];
    car.name = result;
    
    NSIndexPath *path = [NSIndexPath indexPathForRow:alertView.tag inSection:section];
    [self.tableView reloadRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationFade];
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

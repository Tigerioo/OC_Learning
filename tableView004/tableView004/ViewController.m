//
//  ViewController.m
//  tableView004
//
//  Created by 林国强 on 15/5/22.
//  Copyright (c) 2015年 lynn. All rights reserved.
//

#import "ViewController.h"
#import "HeroModel.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableVIew;
@property (nonatomic, strong) NSArray *heros;
@end

@implementation ViewController

- (NSArray *) heros{
    if (_heros == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"heros.plist" ofType:nil];
        
        NSArray *herosArray = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *dictArray = [NSMutableArray array];
        
        for (NSDictionary *dict in herosArray){
            HeroModel *hero = [HeroModel heroWithDict:dict];
            [dictArray addObject:hero];
        }
        _heros = dictArray;
    }
    return _heros;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.heros.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    HeroModel *hero = self.heros[indexPath.row];
    cell.textLabel.text = hero.name;
    cell.detailTextLabel.text = hero.intro;
    cell.imageView.image = [UIImage imageNamed:hero.icon];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//    cell.accessoryView = [[UISwitch alloc] init];
    
    //设置背景
//    UIView *bgView = [[UIView alloc] init];
//    bgView.backgroundColor = [UIColor redColor];
//    cell.backgroundView = bgView;
//    
//    UIView *selectBgView = [[UIView alloc] init];
//    selectBgView.backgroundColor = [UIColor greenColor];
//    cell.selectedBackgroundView = selectBgView;
    
    return cell;
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tableVIew.rowHeight = 60;
    
    //设置分割线颜色
    self.tableVIew.separatorColor = [UIColor colorWithRed:78/255.0 green:100/255.0 blue:255/255.0 alpha:255/255.0];
    //设置分割线样式
    self.tableVIew.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.tableVIew.tableHeaderView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    self.tableVIew.tableFooterView = [UIButton buttonWithType:UIButtonTypeInfoLight];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

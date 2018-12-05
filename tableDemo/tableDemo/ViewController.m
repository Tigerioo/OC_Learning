//
//  ViewController.m
//  tableDemo
//
//  Created by 林国强 on 15/5/20.
//  Copyright (c) 2015年 lynn. All rights reserved.
//

#import "ViewController.h"
#import "HeroModel.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property(nonatomic, strong) NSArray *heros;
@end

@implementation ViewController

- (NSArray *) heros{
    
    if (_heros == nil) {
        //找到路径
        NSString *path = [[NSBundle mainBundle] pathForResource:@"heros.plist" ofType:nil];
        
        //加载数组
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        
        //转成模型
        NSMutableArray *herosArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            HeroModel *model = [HeroModel heroWithDict:dict];
            
            [herosArray addObject:model];
        }
        
        _heros = herosArray;
    }
    
    return _heros;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.heros.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil ];
    
    HeroModel *hero = self.heros[indexPath.row];
    
    cell.textLabel.text = hero.name;
    cell.detailTextLabel.text = hero.intro;
    cell.imageView.image = [UIImage imageNamed:hero.image];
    
    return cell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end

//
//  ViewController.m
//  tableView003
//
//  Created by 林国强 on 15/5/22.
//  Copyright (c) 2015年 lynn. All rights reserved.
//

#import "ViewController.h"
#import "heroModel.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableVIew;
@property (nonatomic, strong) NSArray *heros;
@end

@implementation ViewController

- (NSArray *) heros{
    if (_heros == nil) {
        //读取plist文件
        NSString *path = [[NSBundle mainBundle] pathForResource:@"heros.plist" ofType:nil];
        
        //加载文件内容给NSArray  array里面存的是字典
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        
        //将dictArray里面的数据转成HeroModel对象，放到新的数组里
        NSMutableArray *herosArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            HeroModel *hero = [HeroModel heroWithDict:dict];
            [herosArray addObject:hero];
        }
        _heros = herosArray;
    }
    return _heros;
}

//返回多少行
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.heros.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    //获取heroModel对象
    HeroModel *hero = self.heros[indexPath.row];
    cell.textLabel.text = [hero name];
    cell.detailTextLabel.text = [hero intro];
    cell.imageView.image = [UIImage imageNamed:[hero icon]];
    return cell;
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

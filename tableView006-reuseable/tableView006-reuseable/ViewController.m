//
//  ViewController.m
//  tableView006-reuseable
//
//  Created by 林国强 on 15/5/23.
//  Copyright (c) 2015年 lynn. All rights reserved.
//

#import "ViewController.h"
#import "HeroModel.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableVIew;
@property (nonatomic, strong) NSArray *heros;

@end

@implementation ViewController

- (NSArray *) heros {
    if (_heros == nil){
        //加载plist文件
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

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.heros.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //定义一个静态的局部变量设置Cell的ID标识
    static NSString *ID = @"AAA";
    
    //1 . 通过一个标识去缓存池中寻找可循环利用的cell
    UITableViewCell *cell = [self.tableVIew dequeueReusableCellWithIdentifier:ID];
    
    //2. 如果缓存池找不到可循环利用的cell：创建一个新的cell，给cell贴个标识
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        
        NSLog(@"找不到Cell！");
    }
    
    //3. 给cell设置新的数据
    HeroModel *hero = self.heros[indexPath.row];
    cell.textLabel.text = hero.name;
    cell.detailTextLabel.text = hero.intro;
    cell.imageView.image = [UIImage imageNamed:hero.icon];
    
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

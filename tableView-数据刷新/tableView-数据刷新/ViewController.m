//
//  ViewController.m
//  tableView-数据刷新
//
//  Created by 林国强 on 15/5/23.
//  Copyright (c) 2015年 lynn. All rights reserved.
//

#import "ViewController.h"
#import "HeroModel.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *heros;
@end

@implementation ViewController

- (NSArray *) heros {
    if (_heros == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"heros.plist" ofType:nil];
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *herosArray = [NSMutableArray array];
        
        for (NSDictionary *dict in dictArray){
            HeroModel *hero = [HeroModel heroWithDict:dict];
            [herosArray addObject:hero];
        }
        _heros = herosArray;
    }
    return _heros;
}

/**
 * 总共有多少行
 **/
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.heros.count;
}

/**
 * 每行显示什么数据
 **/
- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //定义一个cell缓存池的ID标识
    static NSString *ID = @"hero";
    
    //从缓存池中拿取cell
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:ID];
    
    //如果缓存池没有数据,则初始化一个cell
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    //给cell赋值
    HeroModel *hero = self.heros[indexPath.row];
    cell.textLabel.text = hero.name;
    cell.detailTextLabel.text = hero.intro;
    cell.imageView.image = [UIImage imageNamed:hero.icon];
    
    return cell;
    
}

- (BOOL)prefersStatusBarHidden{
    return YES;
}

/**
 * 当用户按下时触发
 **/
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    HeroModel *hero = self.heros[indexPath.row];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"信息" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确认", nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    
    [alert textFieldAtIndex:0].text = hero.name;
    
    alert.tag = indexPath.row;
    
    [alert show];
}

/**
 * 监听按下按钮的时候处理逻辑
 **/
- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    //如果是取消按钮，则直接返回
    if (buttonIndex == 0) return ;
    
    NSString *result = [alertView textFieldAtIndex:0].text;
    
    HeroModel *hero = self.heros[alertView.tag];
    
    hero.name = result;
    
    //全局刷新，适合与大批量替换
//    [self.tableView reloadData];
    
    //局部刷新
    NSIndexPath *index = [NSIndexPath indexPathForRow:alertView.tag inSection:0];
    [self.tableView reloadRowsAtIndexPaths:@[index] withRowAnimation:UITableViewRowAnimationLeft];
    
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

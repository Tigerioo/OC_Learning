//
//  ViewController.m
//  团购数据-002
//
//  Created by 林国强 on 15/5/24.
//  Copyright (c) 2015年 lynn. All rights reserved.
//

#import "ViewController.h"
#import "TgModel.h"
#import "TgCell.h"

@interface ViewController ()<UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *tgModels;

@end

@implementation ViewController

- (NSArray *) tgModels{
    if (_tgModels == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"tgs.plist" ofType:nil];
        
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *tgsArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray){
            TgModel *tg = [TgModel tgWithDict:dict];
            [tgsArray addObject:tg];
        }
        _tgModels = tgsArray;
    }
    return _tgModels;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.tgModels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TgCell *cell = [TgCell tgWithTableView:tableView];
    cell.tg = self.tgModels[indexPath.row];
    return cell;
}

- (BOOL)prefersStatusBarHidden{
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tableView.rowHeight = 80;
    
    //定义一个按钮
//    UIButton *footerBtn = [UIButton buttonWithType:UIButtonTypeSystem];
//    footerBtn.frame = CGRectMake(0, 0, 0, 35);
//    footerBtn.backgroundColor = [UIColor orangeColor];
//    [footerBtn setTitle:@"加载更多团购" forState:UIControlStateNormal];
    
    UINib *nib = [UINib nibWithNibName:@"footer" bundle:nil];
    UIView *footerView = [[nib instantiateWithOwner:nil options:nil] lastObject];
    
    self.tableView.tableFooterView = footerView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

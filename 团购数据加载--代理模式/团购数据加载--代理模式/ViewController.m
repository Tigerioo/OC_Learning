//
//  ViewController.m
//  团购数据加载--代理模式
//
//  Created by 林国强 on 15/5/24.
//  Copyright (c) 2015年 lynn. All rights reserved.
//

#import "ViewController.h"
#import "TgModel.h"
#import "TgCell.h"
#import "TgFooterView.h"

@interface ViewController () <UITableViewDataSource, TgFooterViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *tgModels;

@end

@implementation ViewController

- (NSMutableArray *)tgModels{
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

- (void)tgFooterViewLoadMoreData:(TgFooterView *)tgFooterView{
    TgModel *tg = [[TgModel alloc] init];
    tg.title = @"新增的团购菜单";
    tg.icon = @"9b437cdfb3e3b542b5917ce2e9a74890";
    tg.price = @"99";
    tg.buyCount = @"0";
    
    [self.tgModels addObject:tg];
    
    [self.tableView reloadData];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tableView.rowHeight = 80;
    
    //tableView底部加载TgFooterCell
    TgFooterView *footerView = [TgFooterView footerView];
    footerView.delegate = self;
    self.tableView.tableFooterView = footerView;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

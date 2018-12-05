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
#import "TgFooter.h"

@interface ViewController ()<UITableViewDataSource, TgFooterViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *tgModels;

@end

@implementation ViewController

- (void)tgFooterViewLoadMoreData:(TgFooter *)tgFooter{
    TgModel *tg = [[TgModel alloc] init];
    tg.title = @"新增的团购";
    tg.price = @"100";
    tg.buyCount = @"0";
    tg.icon = @"2010e3a0c7f88c3f5f5803bf66addd93";
    
    [self.tgModels addObject:tg];
    [self.tableView reloadData];
}

- (NSMutableArray *) tgModels{
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
    
    TgFooter *tgFooter = [TgFooter tgFooter];
    tgFooter.delegate = self;// 设置代理
    self.tableView.tableFooterView = tgFooter;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

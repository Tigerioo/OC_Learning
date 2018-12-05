//
//  ViewController.m
//  团购数据-003
//
//  Created by 林国强 on 15/5/25.
//  Copyright (c) 2015年 lynn. All rights reserved.
//

#import "ViewController.h"
#import "TgModel.h"
#import "TgCell.h"
#import "TgFooterView.h"

@interface ViewController () <UITableViewDataSource, TgFooterViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *tgs;
@end

@implementation ViewController

- (NSMutableArray *)tgs{
    if (_tgs == nil) {
        _tgs = [NSMutableArray array];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"tgs.plist" ofType:nil];
        NSMutableArray *dictArray = [NSMutableArray arrayWithContentsOfFile:path];
        for (NSDictionary *dict in dictArray){
            [_tgs addObject:[TgModel tgWithDict:dict]];
        }
    }
    return _tgs;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.tgs.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TgCell *cell = [TgCell tgWithTableView:tableView];
    cell.tg = self.tgs[indexPath.row];
    return cell;
}

- (void)tgFooterViewLoadingData:(TgFooterView *)tgFooterView{
    TgModel *tg = [[TgModel alloc] init];
    tg.title = @"测试团购";
    tg.price = @"100";
    tg.buyCount = @"0";
    tg.icon = @"53453be0d2dd458c057286d17f6b9306";
    
    [self.tgs addObject:tg];
    [self.tableView reloadData];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tableView.rowHeight = 80;
    TgFooterView *tgFooterView = [TgFooterView tgFooterView];
    tgFooterView.delegate = self;
    self.tableView.tableFooterView = tgFooterView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

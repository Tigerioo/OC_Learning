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

@interface ViewController ()<UITableViewDataSource, TgFooterDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *tgs;

@end

@implementation ViewController

- (NSMutableArray *) tgs{
    if (_tgs == nil) {
        _tgs = [NSMutableArray array];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"tgs.plist" ofType:nil];
        
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        for (NSDictionary *dict in dictArray){
            [_tgs addObject:[TgModel tgWithDict:dict]];
        }
    }
    return _tgs;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.tgs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TgCell *cell = [TgCell tgWithTableView:tableView];
    cell.tg = self.tgs[indexPath.row];
    return cell;
}

- (BOOL)prefersStatusBarHidden{
    return YES;
}

- (void)tgFooterLoadingMoreData:(TgFooter *)tgFooter{
    TgModel *tg = [[TgModel alloc] init];
    tg.title = @"测试团购";
    tg.price = @"99";
    tg.buyCount = @"0";
    tg.icon = @"37e4761e6ecf56a2d78685df7157f097";
    
    [self.tgs addObject:tg];
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tableView.rowHeight = 80;
    
    TgFooter *tgFooter = [TgFooter tgFooter];
    tgFooter.delegate = self;
    self.tableView.tableFooterView = tgFooter;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

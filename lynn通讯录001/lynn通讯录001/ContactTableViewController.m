//
//  ContactTableViewController.m
//  lynn通讯录001
//
//  Created by 林国强 on 15/6/5.
//  Copyright (c) 2015年 lynn. All rights reserved.
//

#import "ContactTableViewController.h"
#import "AddViewController.h"
#import "ContactModel.h"
#import "EditViewController.h"
#import "ContactCell.h"

@interface ContactTableViewController ()<UIActionSheetDelegate, AddViewControllerDelegate, EditViewControllerDelegate, UITableViewDelegate>
- (IBAction)logOut:(id)sender;
@property (nonatomic, strong) NSMutableArray *contacts;

@end

@implementation ContactTableViewController

- (NSMutableArray *) contacts{
    if (_contacts == nil) {
        _contacts = [NSMutableArray array];
    }
    return _contacts;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.contacts.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ContactCell *cell = [ContactCell cellWithTableView:tableView];
    cell.contact = self.contacts[indexPath.row];
    return cell;
}

#pragma tableView delegate
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //删除数据
        [self.contacts removeObjectAtIndex:indexPath.row];
        
        //刷新数据
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)logOut:(id)sender {
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"确定要注销？" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [sheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) return;
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    id vc = segue.destinationViewController;
    if ([vc isKindOfClass:[AddViewController class]]) {
        AddViewController *addVc = [segue destinationViewController];
        addVc.delegate = self;
    } else {
        EditViewController *editVc = [segue destinationViewController];
        editVc.delegate = self;
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        editVc.contact = self.contacts[indexPath.row];
    }
}

/**
 * 新增代理的方法，新增数据
 **/
- (void)addViewController:(AddViewController *)addVc addContact:(ContactModel *)contact{
    NSLog(@"name is %@, phone is %@.", contact.name, contact.phone);
    //1. 添加模型数据到tableView的数据里
    [self.contacts addObject:contact];
    
    //2.刷新数据
    [self.tableView reloadData];
    
}

/**
 * 编辑后的数据更新
 **/
- (void)editViewController:(EditViewController *)editVc updateContact:(ContactModel *)contact{
    //刷新界面
    [self.tableView reloadData];
}


@end

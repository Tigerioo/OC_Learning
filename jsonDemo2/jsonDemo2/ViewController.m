//
//  ViewController.m
//  jsonDemo2
//
//  Created by 林国强 on 15/7/4.
//  Copyright (c) 2015年 lynn. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)sendRequest;
@property (weak, nonatomic) IBOutlet UILabel *textTip;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sendRequest {
    NSURL *url = [NSURL URLWithString:@"http://115.28.93.210/lgq/date.php"];
    
    NSString *msg = @"Msg=Hello";
    NSData *postData = [msg dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:url];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:postData];
//    [request setValue:@"Hello World!" forKey:@"msg"];
    
//    NSString *contentType = [NSString stringWithFormat:@"text/xml"];
//    [request setValue:contentType forHTTPHeaderField:@"Content-Type"];
    
    NSHTTPURLResponse *urlResponse = nil;
    NSError *error = [[NSError alloc]init];
    
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];
    
    NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    if ([urlResponse statusCode] >= 200 && [urlResponse statusCode] < 300) {
        self.textTip.text = result;
    }
    
}
@end

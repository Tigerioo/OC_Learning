//
//  BcViewController.h
//  ChargeBill
//
//  Created by 林国强 on 4/11/16.
//  Copyright © 2016 lynn. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BcViewController;

@protocol BcViewControllerDelegate<NSObject>

@optional
- (void) displayNewValue:(BcViewController *)bvc getValue:(NSString *)value;

@end

@interface BcViewController : UIViewController

@property (nonatomic, weak) id<BcViewControllerDelegate> delegate;

@end

//
//  LoanTotalsViewController.h
//  Loancalcs
//
//  Created by Charles Konkol on 11/12/13.
//  Copyright (c) 2013 Chuck Konkol. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoancalcsAppDelegate.h"
@interface LoanTotalsViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *totalbalance;
@property (strong, nonatomic) IBOutlet UITextField *totalinterest;
@property (strong) NSMutableArray *loanarray;
@end

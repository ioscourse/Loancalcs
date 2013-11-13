//
//  LoanDetailViewController.h
//  Loancalcs
//
//  Created by Charles Konkol on 11/12/13.
//  Copyright (c) 2013 Chuck Konkol. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoanDetailViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *paymentsperyear;
@property (strong, nonatomic) IBOutlet UITextField *balanceinput;
@property (strong, nonatomic) IBOutlet UITextField *annualpercentagerate;
@property (strong, nonatomic) IBOutlet UITextField *interestrate;
- (IBAction)btnSave:(id)sender;
- (IBAction)btnBack:(id)sender;
@property (strong) NSManagedObject *loandb;
@end

//
//  LoanDetailViewController.m
//  Loancalcs
//
//  Created by Charles Konkol on 11/12/13.
//  Copyright (c) 2013 Chuck Konkol. All rights reserved.
//

#import "LoanDetailViewController.h"

@interface LoanDetailViewController ()

@end

@implementation LoanDetailViewController
@synthesize loandb,paymentsperyear,balanceinput,annualpercentagerate,interestrate;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view.
    // Do any additional setup after loading the view.
    if (self.loandb) {
        [self.paymentsperyear setText:[self.loandb valueForKey:@"paymentsperyear"]];
        [self.balanceinput setText:[self.loandb valueForKey:@"balanceinput"]];
        [self.annualpercentagerate setText:[self.loandb valueForKey:@"annualpercentagerate"]];
        [self.interestrate setText:[self.loandb valueForKey:@"interestinput"]];
    }
}
- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnSave:(id)sender {
    NSManagedObjectContext *context = [self managedObjectContext];
    
    if (self.loandb) {
        // Update existing device
        [self.loandb setValue:self.paymentsperyear.text forKey:@"paymentsperyear"];
        [self.loandb setValue:self.balanceinput.text forKey:@"balanceinput"];
        [self.loandb setValue:self.annualpercentagerate.text forKey:@"annualpercentagerate"];
        double dbalanceinput = [balanceinput.text doubleValue];
        double dannualpercentagerate = [annualpercentagerate.text doubleValue];
        double dpaymentsperyear = [paymentsperyear.text doubleValue];
        double total = dbalanceinput * ((dannualpercentagerate/100)/dpaymentsperyear);
        NSString *totalbalance = [[NSString alloc] initWithFormat:@"%.2f", total];
         [self.loandb setValue:totalbalance forKey:@"interestinput"];
        //interestrate.text=[[NSString alloc] initWithFormat:@"@%f", total];
    } else {
        // Create a new device
        NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"LoanInputs" inManagedObjectContext:context];
        [newDevice setValue:self.paymentsperyear.text forKey:@"paymentsperyear"];
        [newDevice setValue:self.balanceinput.text forKey:@"balanceinput"];
        [newDevice setValue:self.annualpercentagerate.text forKey:@"annualpercentagerate"];
        //B4*((C4/100)/A4)
        //balanceinput*((annualpercentagerate/100)/paymentsperyear)
        double dbalanceinput = [balanceinput.text doubleValue];
        double dannualpercentagerate = [annualpercentagerate.text doubleValue];
        double dpaymentsperyear = [paymentsperyear.text doubleValue];
        double total = dbalanceinput * ((dannualpercentagerate/100)/dpaymentsperyear);
        NSString *totalbalance = [[NSString alloc] initWithFormat:@"%.2f", total];
        [newDevice setValue:totalbalance forKey:@"interestinput"];
       //  interestrate.text=[[NSString alloc] initWithFormat:@"@%f", total];
    }
    NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)btnBack:(id)sender {
      [self dismissViewControllerAnimated:YES completion:nil];
}
@end

//
//  LoanTotalsViewController.m
//  Loancalcs
//
//  Created by Charles Konkol on 11/12/13.
//  Copyright (c) 2013 Chuck Konkol. All rights reserved.
//

#import "LoanTotalsViewController.h"

@interface LoanTotalsViewController ()

@end

@implementation LoanTotalsViewController
@synthesize totalbalance,totalinterest;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (NSManagedObjectContext *)managedObjectContext
{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
  double totalb;
    double interestb;
    // Fetch the devices from persistent data store
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"LoanInputs"];
     //NSManagedObject *matches = nil;
    NSArray *objects= [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    for (NSObject* o in objects)
    {
        NSLog(@"%@",o);
        totalbalance.text = [o valueForKeyPath:@"balanceinput"];
        totalb =(totalb + [totalbalance.text doubleValue]);
        totalinterest.text = [o valueForKeyPath:@"interestinput"];
        interestb =(interestb + [totalinterest.text doubleValue]);
    }
   // matches = objects[0];
   // totalbalance.text = [matches valueForKeyPath:@"balanceinput"];
    totalbalance.text = [NSString stringWithFormat:@"%.2f",totalb];
     totalinterest.text = [NSString stringWithFormat:@"%.2f",interestb];
    NSLog(@"totalbalance: %f", totalb);
    NSLog(@"totalkinterest: %f", interestb);
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

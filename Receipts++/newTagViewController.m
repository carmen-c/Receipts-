//
//  newTagViewController.m
//  Receipts++
//
//  Created by carmen cheng on 2016-11-24.
//  Copyright © 2016 carmen cheng. All rights reserved.
//

#import "newTagViewController.h"

@interface newTagViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *pickDate;
@property (weak, nonatomic) IBOutlet UITextField *amountTextField;
@property (weak, nonatomic) IBOutlet UITextField *noteTextField;
@property (weak, nonatomic) IBOutlet UITextField *tagTextField;

@end

@implementation newTagViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)doneButton:(id)sender {
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Receipt" inManagedObjectContext:self.managedObjectContext];
    NSManagedObject *record = [[NSManagedObject alloc]initWithEntity:entity insertIntoManagedObjectContext:self.managedObjectContext];
    [record setValue:self.amountTextField.text forKey:@"amount"];
    [record setValue:self.noteTextField.text forKey:@"note"];
    [record setValue:self.pickDate.date forKey:@"timeStamp"];
    
    NSError *error = nil;
    if ([self.managedObjectContext save:&error]) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    else{
        if (error) {
            NSLog(@"save error: %@, %@", error, error.localizedDescription);
        }
    }
   
}




@end

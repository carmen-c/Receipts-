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
@property (nonatomic) NSMutableArray *tags;

@end

@implementation newTagViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)tapView:(id)sender {
    [self.amountTextField resignFirstResponder];
    [self.noteTextField resignFirstResponder];
    [self.tagTextField resignFirstResponder];
}

- (IBAction)doneButton:(id)sender {
    
    NSNumberFormatter *format = [[NSNumberFormatter alloc] init];
    format.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber *amount = [format numberFromString:self.amountTextField.text];

    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Receipt" inManagedObjectContext:self.managedObjectContext];
    NSManagedObject *record = [[NSManagedObject alloc]initWithEntity:entity insertIntoManagedObjectContext:self.managedObjectContext];
    
    [record setValue:amount forKey:@"amount"];
    [record setValue:self.noteTextField.text forKey:@"note"];
    [record setValue:self.pickDate.date forKey:@"timeStamp"];
    
    
    NSEntityDescription *tag = [NSEntityDescription entityForName:@"Tag" inManagedObjectContext:self.managedObjectContext];
    NSManagedObject *tagged = [[NSManagedObject alloc]initWithEntity:tag insertIntoManagedObjectContext:self.managedObjectContext];

    [tagged setValue:self.tagTextField.text forKey:@"tagName"];
    
    NSError *error = nil;
    if ([self.managedObjectContext save:&error]) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }else{
        if (error) {
            NSLog(@"save error: %@, %@", error, error.localizedDescription);
        }
    }
   
}



@end

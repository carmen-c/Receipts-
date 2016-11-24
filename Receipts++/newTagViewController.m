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
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



@end

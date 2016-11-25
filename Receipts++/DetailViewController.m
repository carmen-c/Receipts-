//
//  DetailViewController.m
//  Receipts++
//
//  Created by carmen cheng on 2016-11-24.
//  Copyright © 2016 carmen cheng. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *amountLabel;
@property (weak, nonatomic) IBOutlet UILabel *noteLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureView];
}

-(void)configureView{
    if (self.detailReceipt) {
        self.amountLabel.text = @"";
        self.dateLabel.text = self.detailReceipt.timeStamp.description;
        self.noteLabel.text = self.detailReceipt.note.description;
    }
}

-(void)setDetailReceipt:(Receipt *)newDetailReceipt{
    if (_detailReceipt != newDetailReceipt) {
        _detailReceipt = newDetailReceipt;
        
        [self configureView];
    }
}



@end

//
//  ViewController.h
//  Receipts++
//
//  Created by carmen cheng on 2016-11-24.
//  Copyright © 2016 carmen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "Receipts__+CoreDataModel.h"

@interface ViewController : UIViewController
@property (nonatomic) NSManagedObjectContext *managedObjectContext;
@end


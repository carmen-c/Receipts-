//
//  LHLCoreDataStack.h
//  Receipts++
//
//  Created by carmen cheng on 2016-11-24.
//  Copyright © 2016 carmen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface LHLCoreDataStack : NSObject
@property (nonatomic, strong) NSManagedObjectContext *context;
@end

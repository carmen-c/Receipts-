//
//  LHLCoreDataStack.m
//  Receipts++
//
//  Created by carmen cheng on 2016-11-24.
//  Copyright © 2016 carmen cheng. All rights reserved.
//

#import "LHLCoreDataStack.h"

@implementation LHLCoreDataStack

- (instancetype)init
{
    self = [super init];
    if (self) {
        

        NSURL *momdURL = [[NSBundle mainBundle] URLForResource:@"Receipts__" withExtension:@"momd"];
        
        NSManagedObjectModel *mom = [[NSManagedObjectModel alloc]initWithContentsOfURL:momdURL];
        
        NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc]initWithManagedObjectModel:mom];
        
        NSArray *docDirs = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsPath = [docDirs firstObject];
        NSString *dbPath = [documentsPath stringByAppendingPathComponent:@"receipts.db"];
        NSURL *dbUrl = [NSURL fileURLWithPath:dbPath];
        
        NSError *pscError = nil;
        if (![psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:dbUrl options:nil error:&pscError]) {
            NSLog(@"error creating psc %@", pscError);
        
            _context = [[NSManagedObjectContext alloc]initWithConcurrencyType:NSMainQueueConcurrencyType];
            [_context setPersistentStoreCoordinator:psc];
        
        }
    }
    return self;
}

@end

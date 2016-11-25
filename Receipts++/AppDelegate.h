//
//  AppDelegate.h
//  Receipts++
//
//  Created by carmen cheng on 2016-11-24.
//  Copyright © 2016 carmen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;
//@property (readonly, strong) NSManagedObjectContext *managedObjectContext;
//@property (readonly, strong) NSManagedObjectModel *managedObjectModel;

- (void)saveContext;


@end


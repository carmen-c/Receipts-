//
//  Receipt.h
//  Receipts++
//
//  Created by carmen cheng on 2016-11-24.
//  Copyright © 2016 carmen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Receipt : NSObject <NSCoding>
@property (nonatomic, copy) NSString *note;
@property (nonatomic, copy) NSDate *date;
@property (nonatomic, copy) NSNumber *amount;
@property (nonatomic, copy) NSString *tag;
@end

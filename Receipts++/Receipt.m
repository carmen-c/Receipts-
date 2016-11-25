//
//  Receipt.m
//  Receipts++
//
//  Created by carmen cheng on 2016-11-24.
//  Copyright © 2016 carmen cheng. All rights reserved.
//

#import "Receipt.h"

@implementation Receipt

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.amount = [aDecoder decodeObjectForKey:@"amount"];
    self.note = [aDecoder decodeObjectForKey:@"note"];
    self.tag = [aDecoder decodeObjectForKey:@"tag"];
    self.date = [aDecoder decodeObjectForKey:@"date"];
    
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.amount forKey:@"amount"];
    [aCoder encodeObject:self.note forKey:@"note"];
    [aCoder encodeObject:self.tag forKey:@"tag"];
    [aCoder encodeObject:self.date forKey:@"date"];
}

@end

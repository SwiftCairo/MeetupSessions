//
//  Counter.m
//  Threadsafe
//
//  Created by khaled mohamed el morabea on 6/20/18.
//  Copyright © 2018 Instabug. All rights reserved.
//

#import "Counter.h"

@interface Counter ()

@property (nonatomic, assign) int count;
@property (atomic, strong) NSRecursiveLock *lock;

@end

@implementation Counter

- (instancetype)init {
    self = [super init];
    if (self) {
        _count = 0;
        _lock = [[NSRecursiveLock alloc] init];
    }
    return self;
}

- (void)increment {
    //[self.lock lock];
    self.count++;
    //[self.lock unlock];
}

- (void)decrement {
    self.count--;
}


@end

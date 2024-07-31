//
//  ThreadSafeArray.m
//  Threadsafe
//
//  Created by khaled mohamed el morabea on 6/20/18.
//  Copyright © 2018 Instabug. All rights reserved.
//

#import "ThreadSafeArray.h"

@interface ThreadSafeArray ()

@property (atomic, strong) NSMutableArray *array;
@property (nonatomic, strong) dispatch_queue_t queue;

@end

@implementation ThreadSafeArray

- (instancetype)init {
    self = [super init];
    if (self) {
        _array = [[NSMutableArray alloc] init];
         _queue = dispatch_queue_create("com.ThreadSafe,Queue", DISPATCH_QUEUE_CONCURRENT);
    }
    return self;
}

- (void)addObject:(id)object {
    dispatch_barrier_async(self.queue, ^{
        [self.array addObject:object];
    });
}

- (NSArray *)objects {
    __block NSArray *data;
    dispatch_sync(self.queue, ^{
        data = [self.array copy];
    });
    return data;
}

@end

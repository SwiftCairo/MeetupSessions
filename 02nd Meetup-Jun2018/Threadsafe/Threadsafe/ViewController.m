//
//  ViewController.m
//  Threadsafe
//
//  Created by khaled mohamed el morabea on 6/20/18.
//  Copyright © 2018 Instabug. All rights reserved.
//

#import "ViewController.h"
#import "Counter.h"
#import "ThreadSafeArray.h"

@interface ViewController ()

@property (nonatomic, strong) Counter *counter;
@property (nonatomic, strong) ThreadSafeArray *array;
@property (nonatomic, strong) dispatch_queue_t queue;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.queue = dispatch_queue_create("myQueue", 0);
    
    dispatch_async(self.queue, ^{
        dispatch_sync(self.queue, ^{
            NSLog(@"inside block");
        });
    });
    
    NSLog(@"outside block");
    
    //self.counter = [[Counter alloc] init];
     //self.array = [[ThreadSafeArray alloc] init];
    //[self testThreadSafeArrayMultiThreading];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)testCounterMultiThreading {
    int dispatchTarget = 1000;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0ul);
    for(int i=0; i<dispatchTarget; i++) {
        dispatch_async(queue, ^{
            [self.counter increment];
        });
    }
}

- (void)testThreadSafeArrayMultiThreading {
    int dispatchTarget = 1000;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0ul);
    for(int i=0; i<dispatchTarget; i++) {
        dispatch_async(queue, ^{
            [self.array addObject:@"data"];
        });
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

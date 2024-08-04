//
//  ThreadSafeArray.h
//  Threadsafe
//
//  Created by khaled mohamed el morabea on 6/20/18.
//  Copyright © 2018 Instabug. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ThreadSafeArray : NSObject

- (void)addObject:(id)object;
- (NSArray *)objects;

@end

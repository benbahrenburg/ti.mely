/**
 * Time.ly Titanium Timer Project
 * Copyright (c) 2013 by Benjamin Bahrenburg. All Rights Reserved.
 * Licensed under the terms of the MIT License
 * Please see the LICENSE included with this distribution for details.
 *
 * Available at https://github.com/benbahrenburg/ti.mely
 *
 */

#import "TiProxy.h"
#import "MSWeakTimer.h"
@interface TiMelyTimerProxy : TiProxy {
@private
    BOOL isRunning;
    BOOL isInDebug;
    float providedInterval;
    long counter;
}

@property (strong, nonatomic) MSWeakTimer *timer;
@property (assign, nonatomic) dispatch_queue_t privateQueue;

@end

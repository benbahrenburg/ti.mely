/**
 * Time.ly Titanium Timer Project
 * Copyright (c) 2013 by Benjamin Bahrenburg. All Rights Reserved.
 * Licensed under the terms of the MIT License
 * Please see the LICENSE included with this distribution for details.
 */

#import "TiMelyTimerProxy.h"
#import "TiUtils.h"


@implementation TiMelyTimerProxy

- (id)init
{
    if ((self = [super init]))
    {
        self.privateQueue = dispatch_queue_create("com.bencoding.timer.private_queue", DISPATCH_QUEUE_CONCURRENT);
        isRunning = NO;
        providedInterval = 1000;
        counter = 0;
        isInDebug = NO;
    }
    
    return self;
}

- (void)dealloc
{
    if(isRunning){
        [self.timer invalidate];
    }
    
    [_timer invalidate];
}

- (void)start:(id) args
{
    
	// Validate correct number of arguments
	ENSURE_SINGLE_ARG(args, NSDictionary);
    
    providedInterval = [TiUtils floatValue:@"interval" properties:args def:1000];
    
    isInDebug = [TiUtils boolValue:@"debug" properties:args def:NO];
    
    if(isRunning){
        [self stop:nil];
    }
    
    if(isInDebug){
        NSLog(@"[DEBUG] Starting Timer");
    }
    
    [self rememberSelf];
    
    self.timer = [MSWeakTimer scheduledTimerWithTimeInterval:[[NSNumber numberWithFloat:(providedInterval/1000)] doubleValue]
                                                      target:self
                                                    selector:@selector(mainThreadTimerDidFire:)
                                                    userInfo:nil
                                                     repeats:YES
                                               dispatchQueue:self.privateQueue];
    
    isRunning = YES;
}

- (void) stop :(id) unused
{
    if(isInDebug){
        NSLog(@"[DEBUG] Stopping Timer");
    }
    
    if(isRunning){
        [self.timer invalidate];
    }
    
    isRunning = NO;
    counter = 0;
    
    [self forgetSelf];
}


- (IBAction)fireTimer
{
    [self.timer fire];
}

- (void) sendTickFired
{

    if([self _hasListeners:@"onIntervalChange"]){
        
        counter++;
        
        NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys:
							   NUMFLOAT(providedInterval),@"interval",
                               [NSNumber numberWithLong:counter],@"intervalCount",
							   nil
							   ];
        [self fireEvent:@"onIntervalChange" withObject:event];
        
        if(isInDebug){
            NSLog(@"[DEBUG] onIntervalChange event fired");
        }
    }
    
}

#pragma mark - MSWeakTimerDelegate

- (void)mainThreadTimerDidFire:(MSWeakTimer *)timer
{
    if(isInDebug){
        NSLog(@"[DEBUG] Timer fired on main thread");
    }
    
    [self sendTickFired];
}

@end

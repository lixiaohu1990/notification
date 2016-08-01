//
//  Poster.m
//  NotificationSafeDemo
//
//  Created by lixiaohu on 16/6/2.
//  Copyright © 2016年 lixiaohu. All rights reserved.
//

#import "Poster.h"
#import "NSNotificationAdditions.h"
@implementation Poster
- (instancetype)init{
    if (self = [super init]) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSLog(@"\npost thread = %@\n", [NSThread currentThread]);
            [[NSNotificationCenter defaultCenter] postNotificationName:@"TEST" object:nil];
//            [[NSNotificationCenter defaultCenter] postNotificationOnMainThreadWithName:@"TEST" object:nil];
        });
        
//        [[NSNotificationCenter defaultCenter] postNotificationName:@"TEST" object:nil];
        
        
//        [self performSelectorInBackground:@selector(post) withObject:nil];
    }
    
    return self;
}

- (void)post{
    NSLog(@"\npost thread = %@\n", [NSThread currentThread]);
    [[NSNotificationCenter defaultCenter] postNotificationName:@"TEST" object:nil];
}

- (void)dealloc{

}
@end

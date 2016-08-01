//
//  Block.m
//  NotificationSafeDemo
//
//  Created by lixiaohu on 16/6/4.
//  Copyright © 2016年 lixiaohu. All rights reserved.
//

#import "Block.h"

@interface Block ()

@end
@implementation Block
- (void)alarm{
    __weak typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0 * NSEC_PER_SEC)), dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        [self doSomething];
    });
}

- (void)alarmWithBlock:(testBlock)block{
    self.block = block;
}

- (void) doSomething{
    sleep(7);
    NSLog(@"domeThing...");
}

- (void)dealloc{
    NSLog(@"dealloc");
}
@end

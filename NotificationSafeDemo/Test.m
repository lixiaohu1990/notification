//
//  Test.m
//  NotificationSafeDemo
//
//  Created by lixiaohu on 16/6/4.
//  Copyright © 2016年 lixiaohu. All rights reserved.
//

#import "Test.h"
#import "Block.h"
@interface Test ()
@property (nonatomic, strong) Block *block;


@property (nonatomic, strong) dispatch_group_t group;
@end
@implementation Test
- (instancetype)init{
    if (self = [super init]) {
        
        /*
        __weak typeof(self) weakSelf = self;
        Block *a = [[Block alloc] init];
        a.block = ^{
            __strong typeof(self) strongSelf = weakSelf;
            NSLog(@"%@", strongSelf.class);
        };
        self.block = a;
         
         */
        
        __weak typeof(self) weakSelf = self;

        
        
        self.group = dispatch_group_create();
        dispatch_group_async(self.group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            [self doSomething];
//            [self doOtherThing];
        });
        

    }
    
    return self;
}

- (void)doSomething{
    NSLog(@"do some thing");
}

- (void)doOtherThing{
    NSLog(@"do other thing");
}
- (void)dealloc{
    NSLog(@"hohoho dealloc");
}
@end

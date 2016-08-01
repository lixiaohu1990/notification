//
//  Observer.m
//  NotificationSafeDemo
//
//  Created by lixiaohu on 16/6/2.
//  Copyright © 2016年 lixiaohu. All rights reserved.
//

#import "Observer.h"
#import "Poster.h"

@interface Observer ()
@property (nonatomic, assign) NSInteger i;
@property (nonatomic, strong) id observer;
@end
@implementation Observer{

}
- (instancetype)init{
    if (self = [super init]) {
        
//       self.observer = [[NSNotificationCenter defaultCenter] addObserverForName:@"TEST" object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
//            NSLog(@"\nhandle thread = %@\n", [NSThread currentThread]);
//            
//            NSLog(@"handle notification begin");
//            sleep(5);
//            
//            NSLog(@"handle notification end");
//            
//            self.i = 10;
//        }];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleNotification:) name:@"TEST" object:nil];
        NSLog(@"\naddObserver thread = %@\n", [NSThread currentThread]);

    }
    
    return self;
}

- (void)handleNotification:(NSNotification *)noti{
    NSLog(@"\nhandle thread = %@\n", [NSThread currentThread]);

    NSLog(@"handle notification begin");
    sleep(5);
    
    NSLog(@"handle notification end");
    
    self.i = 10;
}

- (void)dealloc{
    
//  NSLog(@"dealloc thread = %@", [NSThread currentThread]);
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
//   
    NSLog(@"notification dealloc");
    if (self.observer) {
        [[NSNotificationCenter defaultCenter] removeObserver:self.observer];
    }
    self.observer = nil;
}
@end

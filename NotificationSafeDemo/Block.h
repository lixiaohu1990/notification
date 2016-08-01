//
//  Block.h
//  NotificationSafeDemo
//
//  Created by lixiaohu on 16/6/4.
//  Copyright © 2016年 lixiaohu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^testBlock)();
@interface Block : NSObject
@property (nonatomic, copy) testBlock block;
- (void)alarmWithBlock:(testBlock)block;
@end

//
//  ViewController.m
//  NotificationSafeDemo
//
//  Created by lixiaohu on 16/6/2.
//  Copyright © 2016年 lixiaohu. All rights reserved.
//

#import "ViewController.h"
#import "Observer.h"
#import "Poster.h"
@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIButton *destroy;

@end

@implementation ViewController{
    Observer *ob;
}


- (void)viewDidLoad {
    [super viewDidLoad];
//    ob = [[Observer alloc] init];
//    Poster *po = [[Poster alloc] init];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)des:(id)sender {
    
    NSLog(@"\nnil thread = %@\n", [NSThread currentThread]);
    
    [ob dealloc];
}

@end

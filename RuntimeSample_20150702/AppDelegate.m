//
//  AppDelegate.m
//  RuntimeSample_20150702
//
//  Created by 啟倫 陳 on 2015/6/28.
//  Copyright (c) 2015年 ChilunChen. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "WhyZero.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    WhyZero *zero = [WhyZero new];
    [zero whyZero];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[MainViewController new]];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
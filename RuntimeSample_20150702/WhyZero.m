//
//  WhyZero.m
//  RuntimeSample_20150702
//
//  Created by DaidoujiChen on 2015/7/3.
//  Copyright (c) 2015年 ChilunChen. All rights reserved.
//

#import "WhyZero.h"
#import <UIKit/UIKit.h>

@implementation WhyZero

- (void)whyZero {
    UIView *view = nil;
    CGRect frame = CGRectMake(10, 10, 10, 10);
    frame = view.frame;
    NSLog(@"%@", NSStringFromCGRect(frame));
}

@end

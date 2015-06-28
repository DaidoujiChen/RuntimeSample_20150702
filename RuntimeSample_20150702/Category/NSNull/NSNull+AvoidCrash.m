//
//  NSNull+AvoidCrash.m
//  RuntimeSample_20150702
//
//  Created by 啟倫 陳 on 2015/6/28.
//  Copyright (c) 2015年 ChilunChen. All rights reserved.
//

#import "NSNull+AvoidCrash.h"

@implementation NSNull (AvoidCrash)

+ (BOOL)resolveInstanceMethod:(SEL)name {
    BOOL resolveInstanceMethod = [super resolveInstanceMethod:name];
    if (!resolveInstanceMethod) {
        NSLog(@"CAN NOT resolve Instance Method : %@", NSStringFromSelector(name));
    }
    return resolveInstanceMethod;
}

@end

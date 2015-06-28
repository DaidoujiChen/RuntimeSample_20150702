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

- (id)forwardingTargetForSelector:(SEL)aSelector {
    id forwardingTargetForSelector = [super forwardingTargetForSelector:aSelector];
    NSLog(@"forwarding Target For Selector : %@", forwardingTargetForSelector);
    return forwardingTargetForSelector;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSMethodSignature *methodSignature = [super methodSignatureForSelector:aSelector];
    if (!methodSignature) {
        NSLog(@"methodSignatureForSelector : %@", NSStringFromSelector(aSelector));
    }
    return methodSignature;
}

@end

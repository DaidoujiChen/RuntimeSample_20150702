//
//  NSNull+AvoidCrash.m
//  RuntimeSample_20150702
//
//  Created by 啟倫 陳 on 2015/6/28.
//  Copyright (c) 2015年 ChilunChen. All rights reserved.
//

#import "NSNull+AvoidCrash.h"
#import <objc/runtime.h>

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
        methodSignature = [[NSNull emptyString] methodSignatureForSelector:aSelector];
    }
    return methodSignature;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"forwardInvocation : %@", anInvocation);
    if ([[NSNull emptyString] respondsToSelector:[anInvocation selector]]) {
        [anInvocation invokeWithTarget:[NSNull emptyString]];
    }
    else {
        [super forwardInvocation:anInvocation];
    }
}

+ (NSString *)emptyString {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        objc_setAssociatedObject(self, _cmd, [NSString new], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    });
    return objc_getAssociatedObject(self, _cmd);
}

@end

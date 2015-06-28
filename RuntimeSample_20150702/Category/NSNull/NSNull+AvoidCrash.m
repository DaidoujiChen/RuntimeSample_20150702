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
        if (name == @selector(length)) {
            class_addMethod([self class], name, (IMP)lengthMethodIMP, "Q@:");
            return YES;
        }
        else if (name == @selector(rangeOfCharacterFromSet:)) {
            class_addMethod([self class], name, (IMP)rangeOfCharacterFromSetMethodIMP, "{NSRange=QQ}@:@");
            return YES;
        }
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

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"forwardInvocation : %@", anInvocation);
    [super forwardInvocation:anInvocation];
}

NSUInteger lengthMethodIMP(id self, SEL _cmd) {
    return 0;
}

NSRange rangeOfCharacterFromSetMethodIMP(id self, SEL _cmd, id arg1) {
    return NSMakeRange(0, 0);
}

@end

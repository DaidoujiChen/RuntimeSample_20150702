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
        NSString *methodName = NSStringFromSelector(name);
        NSLog(@"CAN NOT resolve Instance Method : %@", methodName);
        NSArray *splitSelector = [methodName componentsSeparatedByString:@":"];
        NSMutableString *typeEncoding = [NSMutableString string];
        [typeEncoding appendString:@"@@:"];
        for (NSInteger index = 0; index < splitSelector.count - 1; index++) {
            [typeEncoding appendString:@"*"];
        }
        class_addMethod([self class], name, (IMP)theNilWorldIMP, [typeEncoding UTF8String]);
        return YES;
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

id theNilWorldIMP(id self, SEL _cmd, ...) {
    return nil;
}

@end

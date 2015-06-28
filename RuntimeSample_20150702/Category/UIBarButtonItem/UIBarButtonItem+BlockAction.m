//
//  UIBarButtonItem+BlockAction.m
//  RuntimeSample_20150702
//
//  Created by 啟倫 陳 on 2015/6/28.
//  Copyright (c) 2015年 ChilunChen. All rights reserved.
//

#import "UIBarButtonItem+BlockAction.h"
#import <objc/runtime.h>

@implementation UIBarButtonItem (BlockAction)

#pragma mark - private instance method

- (void)performAction {
    BlockAction blockAction = [self blockAction];
    if (blockAction) {
        blockAction();
    }
}

#pragma mark - instance method

- (instancetype)initWithImage:(UIImage *)image style:(UIBarButtonItemStyle)style blockAction:(BlockAction)blockAction {
    [self setBlockAction:blockAction];
    return [self initWithImage:image style:style target:self action:@selector(performAction)];
}

- (instancetype)initWithImage:(UIImage *)image landscapeImagePhone:(UIImage *)landscapeImagePhone style:(UIBarButtonItemStyle)style blockAction:(BlockAction)blockAction {
    [self setBlockAction:blockAction];
    return [self initWithImage:image landscapeImagePhone:landscapeImagePhone style:style target:self action:@selector(performAction)];
}

- (instancetype)initWithTitle:(NSString *)title style:(UIBarButtonItemStyle)style blockAction:(BlockAction)blockAction {
    [self setBlockAction:blockAction];
    return [self initWithTitle:title style:style target:self action:@selector(performAction)];
}

- (instancetype)initWithBarButtonSystemItem:(UIBarButtonSystemItem)systemItem blockAction:(BlockAction)blockAction {
    [self setBlockAction:blockAction];
    return [self initWithBarButtonSystemItem:systemItem target:self action:@selector(performAction)];
}

#pragma mark - runtime object

- (void)setBlockAction:(BlockAction)blockAction {
    objc_setAssociatedObject(self, @selector(blockAction), blockAction, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (BlockAction)blockAction {
    return objc_getAssociatedObject(self, _cmd);
}

@end
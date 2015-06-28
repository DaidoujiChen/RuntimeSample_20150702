//
//  UIBarButtonItem+BlockAction.h
//  RuntimeSample_20150702
//
//  Created by 啟倫 陳 on 2015/6/28.
//  Copyright (c) 2015年 ChilunChen. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^BlockAction)(void);

@interface UIBarButtonItem (BlockAction)

- (instancetype)initWithImage:(UIImage *)image style:(UIBarButtonItemStyle)style blockAction:(BlockAction)blockAction;
- (instancetype)initWithImage:(UIImage *)image landscapeImagePhone:(UIImage *)landscapeImagePhone style:(UIBarButtonItemStyle)style blockAction:(BlockAction)blockAction;
- (instancetype)initWithTitle:(NSString *)title style:(UIBarButtonItemStyle)style blockAction:(BlockAction)blockAction;
- (instancetype)initWithBarButtonSystemItem:(UIBarButtonSystemItem)systemItem blockAction:(BlockAction)blockAction;

@end
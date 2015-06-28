//
//  HotfixDataViewController.m
//  RuntimeSample_20150702
//
//  Created by 啟倫 陳 on 2015/6/28.
//  Copyright (c) 2015年 ChilunChen. All rights reserved.
//

#import "HotfixDataViewController.h"

@implementation HotfixDataViewController

#pragma mark - private instance method

- (NSString *)avoidNull:(id)content {
    if ([content isKindOfClass:[NSString class]]) {
        return content;
    }
    else {
        return @"";
    }
}

#pragma mark - method override

- (void)setLabels {
    self.nameLabel.text = [self avoidNull:self.content[@"name"]];
    self.mailLabel.text = [self avoidNull:self.content[@"mail"]];
    self.jobLabel.text = [self avoidNull:self.content[@"job"]];
}

@end
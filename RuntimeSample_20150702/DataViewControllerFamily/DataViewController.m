//
//  DataViewController.m
//  RuntimeSample_20150702
//
//  Created by 啟倫 陳 on 2015/6/28.
//  Copyright (c) 2015年 ChilunChen. All rights reserved.
//

#import "DataViewController.h"
#import "UIBarButtonItem+BlockAction.h"

@implementation DataViewController

#pragma mark - private instance method

- (void)setLabels {
    self.nameLabel.text = self.content[@"name"];
    self.mailLabel.text = self.content[@"mail"];
    self.jobLabel.text = self.content[@"job"];
}

#pragma mark - life cycle

- (id)init {
    return [super initWithNibName:@"DataViewController" bundle:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Show Data";
    
    __weak DataViewController *weakSelf = self;
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc] initWithTitle:@"Home" style:UIBarButtonItemStylePlain blockAction: ^{
        if (weakSelf) {
            __strong DataViewController *strongSelf = weakSelf;
            [strongSelf.navigationController popToRootViewControllerAnimated:YES];
        }
    }];
    self.navigationItem.rightBarButtonItem = homeButton;
    
    [self setLabels];
}

@end
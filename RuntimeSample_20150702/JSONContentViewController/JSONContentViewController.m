//
//  JSONContentViewController.m
//  RuntimeSample_20150702
//
//  Created by 啟倫 陳 on 2015/6/28.
//  Copyright (c) 2015年 ChilunChen. All rights reserved.
//

#import "JSONContentViewController.h"
#import <objc/runtime.h>
#import "UIBarButtonItem+BlockAction.h"

@interface JSONContentViewController ()

@property (weak, nonatomic) IBOutlet UITextView *contentTextView;

@end

@implementation JSONContentViewController

#pragma mark - private instance method

- (NSDictionary *)dictionaryNamed:(NSString *)name {
    return [NSJSONSerialization JSONObjectWithData:[self dataNamed:name] options:0 error:NULL];
}

- (NSData *)dataNamed:(NSString *)name {
    NSString *filePath = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:name];
    return [NSData dataWithContentsOfFile:filePath];
}

// code from FLEX at FLEXUtility.m
- (NSString *)prettyJSONStringFromData:(NSData *)data {
    NSString *prettyString = nil;
    
    id jsonObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
    if ([NSJSONSerialization isValidJSONObject:jsonObject]) {
        prettyString = [[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:jsonObject options:NSJSONWritingPrettyPrinted error:NULL] encoding:NSUTF8StringEncoding];
        prettyString = [prettyString stringByReplacingOccurrencesOfString:@"\\/" withString:@"/"];
    }
    else {
        prettyString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    
    return prettyString;
}

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"JSON Content";
    
    self.contentTextView.text = [self prettyJSONStringFromData:[self dataNamed:self.info[@"filename"]]];
    
    __weak JSONContentViewController *weakSelf = self;
    UIBarButtonItem *nextButton = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStylePlain blockAction: ^{
        if (weakSelf) {
            __strong JSONContentViewController *strongSelf = weakSelf;
            NSString *controllerName = strongSelf.info[@"controller"];
            NSString *filename = strongSelf.info[@"filename"];
            id nextController = [NSClassFromString(controllerName) new];
            void (*setContentIMP)(id, SEL, id) = (void (*)(id, SEL, id))[nextController methodForSelector:NSSelectorFromString(@"setContent:")];
            setContentIMP(nextController, NSSelectorFromString(@"setContent:"), [strongSelf dictionaryNamed:filename]);
            [strongSelf.navigationController pushViewController:nextController animated:YES];
        }
    }];
    self.navigationItem.rightBarButtonItem = nextButton;
}

@end
//
//  MainViewController.m
//  RuntimeSample_20150702
//
//  Created by 啟倫 陳 on 2015/6/28.
//  Copyright (c) 2015年 ChilunChen. All rights reserved.
//

#import "MainViewController.h"
#import "JSONContentViewController.h"

@interface MainViewController ()

@property (nonatomic, readonly) NSArray *infos;

@end

@implementation MainViewController

#pragma mark - readonly property

- (NSArray *)infos {
    static NSArray *infos = nil;
    if (!infos) {
        infos = @[@{ @"title": @"Sample1 + DataViewController", @"filename":@"Sample1.json", @"controller":@"DataViewController" },
                  @{ @"title": @"Sample2 + DataViewController", @"filename":@"Sample2.json", @"controller":@"DataViewController" },
                  @{ @"title": @"Sample3 + DataViewController", @"filename":@"Sample3.json", @"controller":@"DataViewController" },
                  @{ @"title": @"Sample3 + HotfixDataViewController", @"filename":@"Sample3.json", @"controller":@"HotfixDataViewController" }];
    }
    return infos;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.infos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"UITableViewCell";
    if (![tableView dequeueReusableCellWithIdentifier:identifier]) {
        [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    NSDictionary *info = self.infos[indexPath.row];
    cell.textLabel.text = info[@"title"];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    JSONContentViewController *jsonContentViewController = [JSONContentViewController new];
    jsonContentViewController.info = self.infos[indexPath.row];
    [self.navigationController pushViewController:jsonContentViewController animated:YES];
}

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Samples List";
}

@end

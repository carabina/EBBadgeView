//
//  ThreeViewController.m
//  BadgeSimple
//
//  Created by 陈凯 on 16/5/7.
//  Copyright © 2016年 EasyBenefit. All rights reserved.
//

#import "ThreeViewController.h"
#import "EBBadgeView.h"

@implementation ThreeViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.navigationItem.title = @"three";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor grayColor];
    [button setTitle:@"Remove one" forState:UIControlStateNormal];
    button.frame = CGRectMake(15, 100, self.view.bounds.size.width-30, 50);
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIViewController *preVc = [self.navigationController.viewControllers objectAtIndex:self.navigationController.viewControllers.count-2];
    preVc.view.eb_badgeModelChangeBlock = ^(id sender){
        [self refreshBadge];
    };
}

- (void)buttonAction:(UIButton*)sender{
    if (_removeBadgeBlock) {
        _removeBadgeBlock();
    }
}

- (void)refreshBadge{
    UIViewController *preVc = [self.navigationController.viewControllers objectAtIndex:self.navigationController.viewControllers.count-2];
    [preVc.view eb_getSubViewsBadgeModelWithBlock:^(EBBadgeModel *badgeModel) {
        if (badgeModel.badgeViewType == EBBadgeViewTypeNumber) {
            self.navigationItem.backBarButtonItem.title = [NSString stringWithFormat:@"first(%ld)",(long)badgeModel.badgeNumber];
        }
    }];
}
@end

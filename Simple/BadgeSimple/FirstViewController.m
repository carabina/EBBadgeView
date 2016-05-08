//
//  FirstViewController.m
//  BadgeSimple
//
//  Created by EasyBenefit on 16/5/7.
//  Copyright © 2016年 EasyBenefit. All rights reserved.
//

#import "FirstViewController.h"
#import "EBBadgeView.h"
#import "ThreeViewController.h"

static NSString *cellIdentifier = @"cellIdentifier";
@interface FirstViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong)NSMutableArray<EBBadgeModel*> *badgeModelList;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"first";
    self.view.backgroundColor = [UIColor whiteColor];
    
    _badgeModelList = [NSMutableArray array];
    for (int i=0; i<5; i++) {
        if (i==0) {
            EBBadgeModel *badgeModel = [EBBadgeModel badgeModelWithType:EBBadgeViewTypeString];
            badgeModel.badgeValue = @"NEW";
            [_badgeModelList addObject:badgeModel];
        }else {
            EBBadgeModel *badgeModel = [EBBadgeModel badgeModelWithType:EBBadgeViewTypeNumber];
            badgeModel.badgeNumber = i + 5;
            [_badgeModelList addObject:badgeModel];
        }
    }
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    tableView.tableFooterView = [UIView new];
    [tableView registerClass:CustomTableViewCell.class forCellReuseIdentifier:cellIdentifier];
    
    tableView.eb_badgeModelChangeBlock = ^(id sender){
        UITableView *senderView = sender;
        [senderView eb_getSubViewsBadgeModelWithBlock:^(EBBadgeModel *badgeModel) {
            [self.tabBarController.tabBar eb_showWithBadgeModel:badgeModel atIndex:0];
            [self.tabBarController.tabBar eb_setItemBadgeOffset:CGPointMake(10, 14)];
        }];
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _badgeModelList.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    [cell.headerImageView eb_showWithBadgeModel:[_badgeModelList objectAtIndex:indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CustomTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    EBBadgeModel *badgeModel = cell.headerImageView.eb_badgeModel;
    if (badgeModel.badgeViewType == EBBadgeViewTypeNumber) {
        badgeModel.badgeNumber--;
        [cell.headerImageView eb_showWithBadgeModel:badgeModel];
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end

@implementation CustomTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
        _headerImageView = [[UIImageView alloc] init];
        _headerImageView.frame = CGRectMake(15, 15, 40, 40);
        [_headerImageView setImage:[UIImage imageNamed:@"demo"]];
        [self.contentView addSubview:_headerImageView];
    }
    return self;
}

@end
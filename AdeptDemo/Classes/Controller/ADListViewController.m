//
//  ADListViewController.m
//  AdeptDemo
//
//  Created by Shen Wenxin on 2017/11/16.
//  Copyright © 2017年 NanJing HOGE Software Co., Ltd. All rights reserved.
//

#import "ADListViewController.h"
#import "ADDetailsViewController.h"
#import "ADDetails1ViewController.h"
#import "ADDetails2ViewController.h"
#import "ADDetails3ViewController.h"

@interface ADListViewController ()
<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView* tblList;
@property (nonatomic, strong) NSMutableArray* dataSourceArray;

@end

@implementation ADListViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self.view setBackgroundColor:[UIColor whiteColor]];
        
        [self prepareData];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self prepareSubviews];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self resetNavigationBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// MARK: - Prepare
- (void)prepareData {
    self.title = NSLocalizedString(@"首页", nil);
    NSMutableArray* array = [NSMutableArray array];
    [array addObject:@"系统导航栏"];
    [array addObject:@"自定义导航栏-全屏"];
    [array addObject:@"自定义导航栏-非全屏"];
    [array addObject:@"自定义导航栏-非全屏-静态页面"];
    
    self.dataSourceArray = array;
}

- (void)prepareSubviews {
    UITableView* tbl = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    [tbl setDataSource:self];
    [tbl setDelegate:self];
    [self.view addSubview:tbl];
    self.tblList = tbl;
    
    UIView* superview = _tblList.superview;
    if (@available(iOS 11.0,*)) {
        [_tblList mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.
            equalTo(superview.mas_safeAreaLayoutGuideTop);
            make.left.
            equalTo(superview.mas_safeAreaLayoutGuideLeft);
            make.right.
            equalTo(superview.mas_safeAreaLayoutGuideRight);
            make.bottom.
            equalTo(superview.mas_safeAreaLayoutGuideBottom);
        }];
    }
    else {
        UIEdgeInsets insets = UIEdgeInsetsZero;
        [_tblList mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(superview).insets(insets);
        }];
    }
}

// MARK: - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  [_dataSourceArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* identifier = @"identifier";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    NSString* string = _dataSourceArray[indexPath.row];
    [cell.textLabel setText:string];
    
    return cell;
}

// MARK: - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString* string = _dataSourceArray[indexPath.row];
    
    if (indexPath.row == 0) {
        [self detailsWithNavitationBar:string];
    }
    else if (indexPath.row == 1) {
        [self details1:string];
    }
    else if (indexPath.row == 2) {
        [self details2:string];
    }
    else if (indexPath.row == 3) {
        [self details3:string];
    }
}

// MARK: Bussiness
- (void)detailsWithNavitationBar:(NSString*)title {
    ADDetailsViewController* controller = [[ADDetailsViewController alloc] init];
    [controller setTitle:title];
    [self.navigationController pushViewController:controller
                                         animated:YES];
}

- (void)details1:(NSString*)title {
    ADDetails1ViewController* controller =
    [[ADDetails1ViewController alloc] init];
    [controller setTitle:title];
    [self.navigationController pushViewController:controller
                                         animated:YES];
}

- (void)details2:(NSString*)title {
    ADDetails2ViewController* controller =
    [[ADDetails2ViewController alloc] init];
    [controller setTitle:title];
    [self.navigationController pushViewController:controller
                                         animated:YES];
}

- (void)details3:(NSString*)title {
    ADDetails3ViewController* controller =
    [[ADDetails3ViewController alloc] init];
    [controller setTitle:title];
    [self.navigationController pushViewController:controller
                                         animated:YES];
}

- (void)resetNavigationBar {
    if (self.navigationController.isNavigationBarHidden) {
        [self.navigationController setNavigationBarHidden:NO
                                                 animated:YES];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

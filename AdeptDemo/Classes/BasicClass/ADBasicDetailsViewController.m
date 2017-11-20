//
//  ADBasicDetailsViewController.m
//  AdeptDemo
//
//  Created by Shen Wenxin on 2017/11/20.
//  Copyright © 2017年 NanJing HOGE Software Co., Ltd. All rights reserved.
//

#import "ADBasicDetailsViewController.h"
#import "ADNavigationView.h"

@interface ADBasicDetailsViewController ()

@end

@implementation ADBasicDetailsViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self.view setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self prepareForNavigationView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setTitle:(NSString *)title {
    [super setTitle:title];
    if (_navigationView) {
        [_navigationView setTitle:title];
    }
}

// MARK: Overwrite
- (ADNavigationView *)navigationView {
    if (_navigationView == nil) {
        _navigationView = [ADNavigationView fullScreenInstance];
        
        [self.view addSubview:_navigationView];
        
        CGFloat height = _navigationView.height;
        UIView* superview = _navigationView.superview;
        [_navigationView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(superview);
            make.leading.equalTo(superview);
            make.trailing.equalTo(superview);
            make.height.mas_equalTo(height);
        }];
    }
    return _navigationView;
}

// MARK: Prepare
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
}

- (void)prepareForNavigationView {
    if (self.navigationView) {
        
        [_navigationView updateTopConstraint:self.mas_topLayoutGuideBottom];
        
        NSString* title = @"返回";
        UIButton* btn = [UIButton buttonWithType:UIButtonTypeSystem];
        [btn setTitle:title forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(didBackButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
        [_navigationView updateLeftItems:@[btn]];
        
    }
    
}

// MARK: Touched Events
- (void)didBackButtonTouched:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
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

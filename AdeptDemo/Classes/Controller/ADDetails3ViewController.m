//
//  ADDetails3ViewController.m
//  AdeptDemo
//
//  Created by Shen Wenxin on 2017/11/20.
//  Copyright © 2017年 NanJing HOGE Software Co., Ltd. All rights reserved.
//

#import "ADDetails3ViewController.h"
#import "ADNavigationView.h"
#import "ADAdapterView.h"

@interface ADDetails3ViewController ()

@property (nonatomic, strong) ADAdapterView* viewAdapter;

@end

@implementation ADDetails3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self prepareSubviews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// MARK: Prepare
- (void)prepareSubviews {
    ADAdapterView* view = [ADAdapterView new];
    [self.view addSubview:view];
    self.viewAdapter = view;
    UIView* superview = _viewAdapter.superview;
    if (@available(iOS 11.0,*)) {
        self.additionalSafeAreaInsets = UIEdgeInsetsMake(0, 10, 10, 10);
        [_viewAdapter mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.
            equalTo(superview.mas_safeAreaLayoutGuideTop).
            offset(_navigationView.height+10.0f);
            make.left.
            equalTo(superview.mas_safeAreaLayoutGuideLeft);
            make.right.
            equalTo(superview.mas_safeAreaLayoutGuideRight);
            make.bottom.
            equalTo(superview.mas_safeAreaLayoutGuideBottom);
        }];
    }
    else {
        UIEdgeInsets padding = UIEdgeInsetsMake(10, 10, 10, 10);
        [_viewAdapter mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_topLayoutGuideBottom).
            offset(padding.top+_navigationView.height);
            make.bottom.equalTo(self.mas_bottomLayoutGuideTop).
            offset(-padding.bottom);
            make.leading.equalTo(superview).offset(padding.left);
            make.trailing.equalTo(superview).offset(-padding.right);
        }];
    }
}

// MARK: Overwrite
- (ADNavigationView *)navigationView {
    if (_navigationView == nil) {
        ADNavigationView* view = [ADNavigationView singleBarInstance];
        
        [self.view addSubview:view];
        
        CGFloat height = view.height;
        UIView* superview = view.superview;
        if (@available(iOS 11.0,*)) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(superview.mas_safeAreaLayoutGuideTop);
                make.leading.trailing.equalTo(superview);
                make.height.mas_equalTo(height);
            }];
        }
        else {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.mas_topLayoutGuideBottom);
                make.leading.trailing.equalTo(superview);
                make.height.mas_equalTo(height);
            }];
        }
        
        _navigationView = view;
    }
    return _navigationView;
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

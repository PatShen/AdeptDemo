//
//  ADDetails2ViewController.m
//  AdeptDemo
//
//  Created by Shen Wenxin on 2017/11/20.
//  Copyright © 2017年 NanJing HOGE Software Co., Ltd. All rights reserved.
//

#import "ADDetails2ViewController.h"
#import "ADNavigationView.h"

@interface ADDetails2ViewController ()

@end

@implementation ADDetails2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

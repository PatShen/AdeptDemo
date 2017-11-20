//
//  ADDetials1ViewController.m
//  AdeptDemo
//
//  Created by Shen Wenxin on 2017/11/20.
//  Copyright © 2017年 NanJing HOGE Software Co., Ltd. All rights reserved.
//

#import "ADDetails1ViewController.h"
#import "ADNavigationView.h"

@interface ADDetails1ViewController ()

@end

@implementation ADDetails1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self installObserver];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [self uninstallObserver];
}


// MARK: Before iOS 11
- (void)installObserver {
    NSNotificationCenter* center = [NSNotificationCenter defaultCenter];
    [center addObserver:self
               selector:@selector(orientationChanged:)
                   name:UIDeviceOrientationDidChangeNotification
                 object:nil];
}

- (void)uninstallObserver {
    NSNotificationCenter* center = [NSNotificationCenter defaultCenter];
    [center removeObserver:self];
}

- (void)orientationChanged:(NSNotification *)notification{
    [self adjustViewsForOrientation:[[UIApplication sharedApplication] statusBarOrientation]];
}

- (void)adjustViewsForOrientation:(UIInterfaceOrientation) orientation {
    switch (orientation) {
        case UIInterfaceOrientationPortrait: {
            //load the portrait view
            CGFloat height = _navigationView.height;
            if (height <= _navigationView.contentHeight) {
                CGFloat top = [[UIApplication sharedApplication] statusBarFrame].size.height;
                height = top+_navigationView.contentHeight;
                [_navigationView updateHeight:height];
            }
            [_navigationView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(height);
            }];
            
            [_navigationView updateTopConstraint:self.mas_topLayoutGuideBottom];
        }
        
            break;
        case UIInterfaceOrientationLandscapeLeft:
        case UIInterfaceOrientationLandscapeRight: {
            //load the landscape view
            CGFloat height = _navigationView.contentHeight;
            [_navigationView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(height);
            }];
            
            [_navigationView updateTopConstraint:self.mas_topLayoutGuideBottom];
        }
            break;
        default:
            break;
    }
}

/*
// MARK: After iOS 11
- (void)viewSafeAreaInsetsDidChange {
    [super viewSafeAreaInsetsDidChange];
    UIInterfaceOrientation ori =
    self.preferredInterfaceOrientationForPresentation;
    if (ori == UIInterfaceOrientationPortrait) {
        CGFloat height = _navigationView.height;
        if (height <= _navigationView.contentHeight) {
            CGFloat top = [[UIApplication sharedApplication] statusBarFrame].size.height;
            height = top+_navigationView.contentHeight;
            [_navigationView updateHeight:height];
        }
        [_navigationView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(height);
        }];
    }
    else if (UIInterfaceOrientationIsLandscape(ori)) {
        CGFloat height = _navigationView.contentHeight;
        [_navigationView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(height);
        }];
    }
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

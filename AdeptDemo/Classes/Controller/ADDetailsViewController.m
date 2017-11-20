//
//  ADDetailsViewController.m
//  AdeptDemo
//
//  Created by Shen Wenxin on 2017/11/16.
//  Copyright © 2017年 NanJing HOGE Software Co., Ltd. All rights reserved.
//

#import "ADDetailsViewController.h"
#import "ADAdapterView.h"

@interface ADDetailsViewController ()

@property (nonatomic, strong) ADAdapterView* viewAdapter;

@end

@implementation ADDetailsViewController
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
            equalTo(superview.mas_safeAreaLayoutGuideTop).offset(10.0f);
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
            offset(padding.top);
            make.bottom.equalTo(self.mas_bottomLayoutGuideTop).
            offset(-padding.bottom);
            make.leading.equalTo(superview).offset(padding.left);
            make.trailing.equalTo(superview).offset(-padding.right);
        }];
    }
}

// MARK: Rotate
- (BOOL)shouldAutorotate {
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
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

//
//  ADBasicDetailsViewController.h
//  AdeptDemo
//
//  Created by Shen Wenxin on 2017/11/20.
//  Copyright © 2017年 NanJing HOGE Software Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ADNavigationView;

@interface ADBasicDetailsViewController : UIViewController {
    ADNavigationView* _navigationView;
}

@property (nonatomic, strong) ADNavigationView* navigationView;

@end

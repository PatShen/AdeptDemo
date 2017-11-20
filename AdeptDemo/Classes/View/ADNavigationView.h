//
//  ADNavigationView.h
//  AdeptDemo
//
//  Created by Shen Wenxin on 2017/11/20.
//  Copyright © 2017年 NanJing HOGE Software Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ADNavigationView : UIView

@property (nonatomic, assign, readonly) CGFloat height;
@property (nonatomic, assign, readonly) CGFloat contentHeight;

@property (nonatomic, copy) NSString* title;

- (void)updateLeftItems:(NSArray*)items;

- (void)updateHeight:(CGFloat)height;

- (void)updateTopConstraint:(id)constraint;


+ (instancetype)fullScreenInstance;

+ (instancetype)singleBarInstance;

@end

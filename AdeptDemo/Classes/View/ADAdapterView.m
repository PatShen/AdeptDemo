//
//  ADAdapterView.m
//  AdeptDemo
//
//  Created by Shen Wenxin on 2017/11/17.
//  Copyright © 2017年 NanJing HOGE Software Co., Ltd. All rights reserved.
//

#import "ADAdapterView.h"

@interface ADAdapterView ()

@property (nonatomic, strong) UIView* view1;
@property (nonatomic, strong) UIView* view2;
@property (nonatomic, strong) UIView* view3;

@end

@implementation ADAdapterView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UIColor* color = nil;
        UIView* view = nil;
        
        color = [UIColor colorWithRed:8/255.0f green:76/255.0f blue:97/255.0f alpha:1.0f];
        view = [UIView new];
        [view setBackgroundColor:color];
        [self addSubview:view];
        self.view3 = view;
        
        color = [UIColor colorWithRed:219/255.0f green:58/255.0f blue:52/255.0f alpha:1.0f];
        view = [UIView new];
        [view setBackgroundColor:color];
        [self addSubview:view];
        self.view2 = view;
        
        color = [UIColor colorWithRed:255/255.0f green:200/255.0f blue:87/255.0f alpha:1.0f];
        view = [UIView new];
        [view setBackgroundColor:color];
        [self addSubview:view];
        self.view1 = view;
        
        color = [UIColor colorWithRed:23/255.0f green:126/255.0f blue:137/255.0f alpha:1.0f];
        [self setBackgroundColor:color];
    }
    return self;
}

- (void)updateConstraints {
    [super updateConstraints];
    
    CGFloat height = 44.0f;
    CGFloat width = 120.0f;
    UIEdgeInsets padding = UIEdgeInsetsMake(10, 10, 10, 10);
    
    if (@available(iOS 11.0,*)) {
        UIView* superview = _view1.superview;
        [_view1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(superview.mas_safeAreaLayoutGuideTop).
            offset(padding.top);
            make.left.equalTo(superview.mas_safeAreaLayoutGuideLeft);
            make.right.equalTo(superview.mas_safeAreaLayoutGuideRight);
            make.height.mas_equalTo(height);
        }];
        
        [_view2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(superview.mas_safeAreaLayoutGuideTop);
            make.left.equalTo(superview.mas_safeAreaLayoutGuideLeft);
            make.width.mas_equalTo(width);
            make.bottom.equalTo(superview.mas_safeAreaLayoutGuideBottom).
            offset(-padding.bottom);
        }];
        
        [_view3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(superview.mas_safeAreaLayoutGuideBottom).
            offset(-padding.bottom);
            make.right.equalTo(superview.mas_safeAreaLayoutGuideRight).
            offset(-padding.right);
            make.width.mas_equalTo(width);
            make.height.mas_equalTo(height);
        }];
    }
    else {
        UIView* superview = _view1.superview;
        [_view1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(superview).offset(padding.top);
            make.leading.trailing.equalTo(superview);
            make.height.mas_equalTo(height);
        }];
        
        [_view2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(superview);
            make.left.equalTo(superview);
            make.width.mas_equalTo(width);
            make.bottom.equalTo(superview).offset(-padding.bottom);
        }];
        
        [_view3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(superview).offset(-padding.bottom);
            make.right.equalTo(superview).offset(-padding.right);
            make.width.mas_equalTo(width);
            make.height.mas_equalTo(height);
        }];
    }
    
}

@end

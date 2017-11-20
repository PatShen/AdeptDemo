//
//  ADNavigationView.m
//  AdeptDemo
//
//  Created by Shen Wenxin on 2017/11/20.
//  Copyright © 2017年 NanJing HOGE Software Co., Ltd. All rights reserved.
//

#import "ADNavigationView.h"

@interface ADNavigationView () {
    
}

@property (nonatomic, assign) UIEdgeInsets padding;

@property (nonatomic, strong) NSMutableArray* leftItems;

@property (nonatomic, strong) UILabel* lblTitle;

@property (nonatomic, strong) MASViewAttribute* topAttribute;

@end

@implementation ADNavigationView

+ (instancetype)fullScreenInstance {
    ADNavigationView* view = [ADNavigationView new];
    return view;
}

+ (instancetype)singleBarInstance {
    ADNavigationView* view = [ADNavigationView new];
    [view updateContentHeight:44.0f];
    [view updateHeight:view.contentHeight];
    view.padding = UIEdgeInsetsZero;
    return view;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize];
        
        UIColor* color = [UIColor colorWithRed:207/255.0f green:222/255.0f blue:231/255.0f alpha:0.5f];
        [self setBackgroundColor:color];
        
        CGFloat top = [[UIApplication sharedApplication] statusBarFrame].size.height;
        [self updateContentHeight:44.0f];
        [self updateHeight:top+self.contentHeight];
        self.padding = UIEdgeInsetsMake(top, 0, 0, 0);
        
    }
    return self;
}

// MARK:
- (void)initialize {
    UILabel* lbl = [UILabel new];
    [lbl setTextAlignment:NSTextAlignmentCenter];
    [self addSubview:lbl];
    self.lblTitle = lbl;
}

// MARK: Private
// MARK: Layout
- (void)updateConstraints {
    [super updateConstraints];
    [self layoutTitle];
    [self layoutLeftItems];
}

- (void)layoutTitle {
    UIView* superview = _lblTitle.superview;
    if (@available(iOS 11.0,*)) {
        [_lblTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(superview);
            make.trailing.equalTo(superview);
            make.top.equalTo(superview.mas_safeAreaLayoutGuideTop);
            make.bottom.equalTo(superview.mas_safeAreaLayoutGuideBottom);
        }];
    }
    else {
        [_lblTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(superview);
            make.trailing.equalTo(superview);
            if (_topAttribute) {
                make.top.equalTo(_topAttribute);
            }
            else {
                make.top.equalTo(superview).
                offset(_padding.top);
            }
            make.bottom.equalTo(superview);
        }];
    }
}

- (void)layoutLeftItems {
    NSArray* array = [NSArray arrayWithArray:_leftItems];
    for (NSInteger idx = 0; idx < [array count]; idx++) {
        UIButton* btn = array[idx];
        if ([btn isKindOfClass:[UIButton class]]) {
            [self addSubview:btn];
            
            UIButton* pre = nil;
            if (idx > 0) {
                pre = array[idx-1];
            }
            CGFloat width = 44.0f;
            UIView* superview = btn.superview;
            
            if ([pre isKindOfClass:[UIButton class]]) {
                if (@available(iOS 11.0,*)) {
                    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.leading.equalTo(pre.mas_trailing);
                        make.top.
                        equalTo(superview.mas_safeAreaLayoutGuideTop);
                        make.bottom.
                        equalTo(superview.mas_safeAreaLayoutGuideBottom);
                        make.width.mas_equalTo(width);
                    }];
                }
                else {
                    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.leading.equalTo(pre.mas_trailing);
                        if (_topAttribute) {
                            make.top.equalTo(_topAttribute);
                        }
                        else {
                            make.top.equalTo(btn.superview).
                            offset(_padding.top);
                        }
                        make.bottom.equalTo(btn.superview);
                        make.width.mas_equalTo(width);
                    }];
                }
            }
            else {
                if (@available(iOS 11.0,*)) {
                    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.left.
                        equalTo(superview.mas_safeAreaLayoutGuideLeft);
                        make.top.
                        equalTo(superview.mas_safeAreaLayoutGuideTop);
                        make.bottom.
                        equalTo(superview.mas_safeAreaLayoutGuideBottom);
                        make.width.mas_equalTo(width);
                    }];
                }
                else {
                    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.leading.equalTo(btn.superview);
                        if (_topAttribute) {
                            make.top.equalTo(_topAttribute);
                        }
                        else {
                            make.top.equalTo(btn.superview).
                            offset(_padding.top);
                        }
                        make.bottom.equalTo(btn.superview);
                        make.width.mas_equalTo(width);
                    }];
                }
            }
        }
    }
}

// MARK: Overwrite
- (void)setTitle:(NSString *)title {
    _title = title;
    [_lblTitle setText:title];
    
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

// MARK: Public
- (void)updateLeftItems:(NSArray *)items {
    NSArray* array = @[];
    if ([items isKindOfClass:[NSArray class]]) {
        array = [NSArray arrayWithArray:items];
    }
    if ([_leftItems count] > 0) {
        for (UIButton* btn in _leftItems) {
            [btn removeFromSuperview];
        }
        [_leftItems removeAllObjects];
    }
    self.leftItems = [NSMutableArray arrayWithArray:array];
    
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)updateHeight:(CGFloat)height {
    _height = height;
}

- (void)updateContentHeight:(CGFloat)height {
    _contentHeight = height;
}

- (void)updateTopConstraint:(id)constraint {
    if (@available(iOS 11.0,*)) {
        
    }
    else {
        if ([constraint isKindOfClass:[MASViewAttribute class]]) {
            self.topAttribute = constraint;
            
            [self setNeedsUpdateConstraints];
            [self updateConstraintsIfNeeded];
            [self setNeedsLayout];
            [self layoutIfNeeded];
        }
    }
}

@end

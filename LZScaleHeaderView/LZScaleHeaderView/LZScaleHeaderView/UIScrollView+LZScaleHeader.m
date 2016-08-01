//
//  UIScrollView+LZScaleHeader.m
//  LZScaleHeaderView
//
//  Created by Artron_LQQ on 16/7/31.
//  Copyright © 2016年 Artup. All rights reserved.
//

#import "UIScrollView+LZScaleHeader.h"
#import <objc/runtime.h>

#define LZScreenWidth ([[UIScreen mainScreen]bounds].size.width)

static CGFloat LZScaleHeaderHeight = 200.0;
static char UIScrollViewHeaderView;
static UIView *__coverView = nil;

@implementation UIScrollView (LZScaleHeader)
- (void)setScaleHeaderView:(LZScaleHeaderView *)scaleHeaderView {
    
    [self willChangeValueForKey:@"scaleHeaderView"];
    objc_setAssociatedObject(self, &UIScrollViewHeaderView,
                             scaleHeaderView,
                             OBJC_ASSOCIATION_ASSIGN);
    [self didChangeValueForKey:@"scaleHeaderView"];
}

- (LZScaleHeaderView *)scaleHeaderView {
    
    return objc_getAssociatedObject(self, &UIScrollViewHeaderView);
}

- (CGFloat)headerHeight {
    
    return  LZScaleHeaderHeight;
}

- (void)setHeaderHeight:(CGFloat)headerHeight {
    
    LZScaleHeaderHeight = headerHeight;
}

- (void)addScaleHeaderWithImage:(UIImage *)image {
    
    LZScaleHeaderView *view = [[LZScaleHeaderView alloc] initWithFrame:CGRectMake(0,0, LZScreenWidth, LZScaleHeaderHeight)];
    
    if ([self isKindOfClass:[UITableView class]]) {
        
        UITableView *table = (UITableView *)self;
        UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, LZScreenWidth, LZScaleHeaderHeight)];
        table.tableHeaderView = bgView;
    }
    
    view.backgroundColor = [UIColor clearColor];
    view.image = image;
    view.scrollView = self;
    
    [self addSubview:view];
    
    self.scaleHeaderView = view;
}

- (void)addScaleHeaderWithImage:(UIImage *)image andCoverView:(UIView *)coverView {
    
    [self addScaleHeaderWithImage:image];
    
    if (coverView != nil) {
        coverView.frame = CGRectMake(0, 0, LZScreenWidth, LZScaleHeaderHeight);
        
        [self addSubview:coverView];
        __coverView = coverView;
    }
}

- (void)removeScaleHeaderView {
    
    [self.scaleHeaderView removeFromSuperview];
    self.scaleHeaderView = nil;
    
    if (__coverView != nil) {
        [__coverView removeFromSuperview];
        __coverView = nil;
    }
}

@end

@implementation LZScaleHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.contentMode = UIViewContentModeScaleAspectFill;
        self.clipsToBounds = YES;
    }
    
    return self;
}

- (void)setScrollView:(UIScrollView *)scrollView
{
    
    [_scrollView removeObserver:self forKeyPath:@"contentOffset"];
    _scrollView = scrollView;
    [_scrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    [self setNeedsLayout];
}

- (void)removeFromSuperview
{
    [_scrollView removeObserver:self forKeyPath:@"contentOffset"];
    [super removeFromSuperview];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat offSetY = self.scrollView.contentOffset.y;
    
    if (offSetY < 0) {
        
        CGRect rect = self.frame;
        
        CGFloat originY = - self.scrollView.contentOffset.y;
        
        CGFloat originX = originY/rect.size.height * rect.size.width * 0.6;
        
        CGRect newRect = CGRectMake(-originX, -originY,LZScreenWidth + 2*originX, LZScaleHeaderHeight + originY);
        
        self.frame = newRect;
    }
}
@end
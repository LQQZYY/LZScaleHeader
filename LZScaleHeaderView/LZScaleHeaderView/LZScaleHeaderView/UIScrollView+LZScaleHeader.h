//
//  UIScrollView+LZScaleHeader.h
//  LZScaleHeaderView
//
//  Created by Artron_LQQ on 16/7/31.
//  Copyright © 2016年 Artup. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LZScaleHeaderView;
@interface UIScrollView (LZScaleHeader)

@property(nonatomic,weak,readonly)LZScaleHeaderView *scaleHeaderView;
@property (nonatomic,assign)CGFloat headerHeight;

/** 添加表头,只包含一张图片*/
- (void)addScaleHeaderWithImage:(UIImage *)image;
/** 添加表头,包含一张背景图片和自定义视图*/
- (void)addScaleHeaderWithImage:(UIImage *)image andCoverView:(UIView *)coverView;
/** 移除*/
- (void)removeScaleHeaderView;
@end


@interface LZScaleHeaderView : UIImageView
@property (nonatomic, strong) UIScrollView *scrollView;
@end
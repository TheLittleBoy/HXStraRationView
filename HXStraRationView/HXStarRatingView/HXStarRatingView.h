//
//  HXStarRatingView.h
//  HXStraRationView
//
//  Created by MAC_AO on 15/2/8.
//  Copyright (c) 2015年 MAC_AO. All rights reserved.
//

#import <UIKit/UIKit.h>


@class HXStarRatingView;
@protocol HXStarRatingViewDelegate <NSObject>
@optional
- (void)starRateView:(HXStarRatingView *)starRateView scroePercentDidChange:(CGFloat)newScorePercent;
@end

@interface HXStarRatingView : UIView

@property (nonatomic, assign) BOOL allowSelectStar;//是否允许评分，默认为NO
@property (nonatomic, assign) CGFloat scorePercent;//得分值，范围为0--1，默认为1
@property (nonatomic, assign) BOOL hasAnimation;//是否允许动画，默认为NO
@property (nonatomic, assign) BOOL allowIncompleteStar;//评分时是否允许不是整星，默认为NO
@property (nonatomic, assign) BOOL isShowBlankStar;//是否显示背景空白星，默认为YES


@property (nonatomic, weak) id<HXStarRatingViewDelegate>delegate;

- (instancetype)initWithFrame:(CGRect)frame numberOfStars:(NSInteger)numberOfStars;

@end

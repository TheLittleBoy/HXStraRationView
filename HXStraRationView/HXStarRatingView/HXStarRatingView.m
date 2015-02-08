//
//  HXStarRatingView.m
//  HXStraRationView
//
//  Created by MAC_AO on 15/2/8.
//  Copyright (c) 2015年 MAC_AO. All rights reserved.
//

#import "HXStarRatingView.h"

#define FOREGROUND_STAR_IMAGE_NAME @"icon_star_yellow"
#define BACKGROUND_STAR_IMAGE_NAME @"icon_star_gray"
#define DEFALUT_STAR_NUMBER 5
#define ANIMATION_TIME_INTERVAL 0.2

@interface HXStarRatingView ()

@property (nonatomic, strong) UIView *foregroundStarView;
@property (nonatomic, strong) UIView *backgroundStarView;

@property (nonatomic, assign) NSInteger numberOfStars;
@property (nonatomic, strong) UITapGestureRecognizer *tapGesture;

@end

@implementation HXStarRatingView


#pragma mark - Init Methods

- (instancetype)init {
    return [self initWithFrame:CGRectZero numberOfStars:DEFALUT_STAR_NUMBER];
}

- (instancetype)initWithFrame:(CGRect)frame {
    return [self initWithFrame:frame numberOfStars:DEFALUT_STAR_NUMBER];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        _numberOfStars = DEFALUT_STAR_NUMBER;
        [self buildDataAndUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame numberOfStars:(NSInteger)numberOfStars {
    if (self = [super initWithFrame:frame]) {
        _numberOfStars = numberOfStars;
        [self buildDataAndUI];
    }
    return self;
}

#pragma mark - Private Methods

- (void)buildDataAndUI {
    _scorePercent = 1;//默认为1
    _hasAnimation = NO;//默认为NO
    _allowIncompleteStar = NO;//默认为NO
    _isShowBlankStar = YES;//默认为YES
    
    self.foregroundStarView = [self createStarViewWithImage:FOREGROUND_STAR_IMAGE_NAME];
    self.backgroundStarView = [self createStarViewWithImage:BACKGROUND_STAR_IMAGE_NAME];
    
    [self addSubview:self.backgroundStarView];
    [self addSubview:self.foregroundStarView];
    
}

- (void)userTapRateView:(UITapGestureRecognizer *)gesture {
    CGPoint tapPoint = [gesture locationInView:self];
    CGFloat offset = tapPoint.x;
    CGFloat realStarScore = offset / (self.bounds.size.width / self.numberOfStars);
    CGFloat starScore = self.allowIncompleteStar ? realStarScore : ceilf(realStarScore);
    self.scorePercent = starScore / self.numberOfStars;
}

- (UIView *)createStarViewWithImage:(NSString *)imageName {
    UIView *view = [[UIView alloc] initWithFrame:self.bounds];
    view.clipsToBounds = YES;
    view.backgroundColor = [UIColor clearColor];
    for (NSInteger i = 0; i < self.numberOfStars; i ++)
    {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
        imageView.frame = CGRectMake(i * self.bounds.size.width / self.numberOfStars, 0, self.bounds.size.width / self.numberOfStars, self.bounds.size.height);
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [view addSubview:imageView];
    }
    return view;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    __weak typeof(self) weakSelf = self;
    CGFloat animationTimeInterval = self.hasAnimation ? ANIMATION_TIME_INTERVAL : 0;
    [UIView animateWithDuration:animationTimeInterval animations:^{
        weakSelf.foregroundStarView.frame = CGRectMake(0, 0, weakSelf.bounds.size.width * weakSelf.scorePercent, weakSelf.bounds.size.height);
    }];
}

#pragma mark - Get and Set Methodsa

-(UITapGestureRecognizer*)tapGesture
{
    if (!_tapGesture) {
        _tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(userTapRateView:)];
        _tapGesture.numberOfTapsRequired = 1;
    }
    return _tapGesture;
}

- (void)setScorePercent:(CGFloat)scroePercent {
    if (_scorePercent == scroePercent) {
        return;
    }
    
    if (scroePercent < 0) {
        _scorePercent = 0;
    } else if (scroePercent > 1) {
        _scorePercent = 1;
    } else {
        _scorePercent = scroePercent;
    }
    
    if ([self.delegate respondsToSelector:@selector(starRateView:scroePercentDidChange:)]) {
        [self.delegate starRateView:self scroePercentDidChange:scroePercent];
    }
    
    [self setNeedsLayout];
}

-(void)setAllowSelectStar:(BOOL)allowSelectStar
{
    if (_allowSelectStar == allowSelectStar) {
        return;
    }
    if (allowSelectStar) {

        [self addGestureRecognizer:self.tapGesture];
    }else
    {
        [self removeGestureRecognizer:self.tapGesture];
    }
    _allowSelectStar = allowSelectStar;
}

-(void)setIsShowBlankStar:(BOOL)isShowBlankStar
{
    if (_isShowBlankStar == isShowBlankStar) {
        return;
    }
    if (isShowBlankStar) {
        
        [self.backgroundStarView setHidden:NO];
    }else
    {
        [self.backgroundStarView setHidden:YES];
    }
    _isShowBlankStar = isShowBlankStar;
}

@end

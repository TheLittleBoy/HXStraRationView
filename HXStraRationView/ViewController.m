//
//  ViewController.m
//  HXStraRationView
//
//  Created by MAC_AO on 15/2/12.
//  Copyright (c) 2015年 MAC_AO. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<HXStarRatingViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    HXStarRatingView *starRateView1 = [[HXStarRatingView alloc] initWithFrame:CGRectMake(10, 100, 200, 40) numberOfStars:5];
    starRateView1.scorePercent = 0.4;
    starRateView1.allowIncompleteStar = NO;
    starRateView1.hasAnimation = YES;
    starRateView1.delegate = self;
    [self.view addSubview:starRateView1];
    
    
    
    HXStarRatingView *starRateView2 = [[HXStarRatingView alloc] initWithFrame:CGRectMake(10, 200, 200, 40) numberOfStars:5];
    starRateView2.scorePercent = 0.6;
    starRateView2.allowIncompleteStar = NO;
    starRateView2.hasAnimation = YES;
    starRateView2.delegate = self;
    starRateView2.isShowBlankStar = NO;
    [self.view addSubview:starRateView2];
    
    HXStarRatingView *starRateView3 = [[HXStarRatingView alloc] initWithFrame:CGRectMake(10, 300, 200, 40) numberOfStars:5];
    starRateView3.scorePercent = 0.8;
    starRateView3.allowIncompleteStar = NO;
    starRateView3.hasAnimation = YES;
    starRateView3.delegate = self;
    starRateView3.allowSelectStar = YES;
    [self.view addSubview:starRateView3];
    
    
    HXStarRatingView *starRateView4 = [[HXStarRatingView alloc] initWithFrame:CGRectMake(10, 400, 200, 40) numberOfStars:5];
    starRateView4.scorePercent = 0.9;
    starRateView4.allowIncompleteStar = YES;
    starRateView4.hasAnimation = YES;
    starRateView4.delegate = self;
    starRateView4.allowSelectStar = YES;
    [self.view addSubview:starRateView4];
    
    
    _myNibView.numberOfStars = 6;
    _myNibView.scorePercent = 0.5;
    
}

- (void)starRateView:(HXStarRatingView *)starRateView scroePercentDidChange:(CGFloat)newScorePercent
{
    NSLog(@"new %lf",newScorePercent);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

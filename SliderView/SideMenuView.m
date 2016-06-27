//
//  SideMenuView.m
//  SliderView
//
//  Created by Van Thanh Tran on 6/26/16.
//  Copyright © 2016 Van Thanh Tran. All rights reserved.
//

#import "SideMenuView.h"
@interface SideMenuView () {
    
}
@property (strong, nonatomic) UIView *overlayView;
@property (strong, nonatomic) UITapGestureRecognizer *tapGesture;
@end

@implementation SideMenuView

-(instancetype)initWithView:(UITableView *)view {
    if (self = [super init])
    {
        [self baseInit];
        self.visibleView = view;
    }
    
    return self;
}

-(instancetype)initWithWidth:(CGFloat)width andDirection:(MenuSidePosition)direction andView:(UITableView *)view andCurretController:(UIViewController *)controller{
    if ((self = [super init]))
    {
        [self baseInit];
        
        self.width = width;
        self.menuSidePosition = direction;
        self.visibleView = view;
        self.currentViewController = controller;
    }
    
    return self;
}

-(void)baseInit {
    self.width = 220;
    self.menuSidePosition = Position_Left;
    self.enableOverlay = YES;
    self.hideOnSelection = YES;
    self.blurEffectStyle = UIBlurEffectStyleExtraLight;
}

#pragma mark - init view 
- (void)initView {
    self.overlayView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.overlayView.alpha = 0;
    self.overlayView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    if (self.enableOverlay) self.overlayView.backgroundColor = [UIColor colorWithWhite:0. alpha:.4];
    
    if (self.hideOnSelection) {
        self.tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTap:)];
        [self.overlayView addGestureRecognizer:self.tapGesture];
    }
    
    CGRect frame = [self getFrameSideMenuHide];
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:self.blurEffectStyle];
    self.view = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    self.visibleView.frame  = frame;
    self.visibleView.separatorColor = [UIColor clearColor];
    self.visibleView.backgroundColor = [UIColor clearColor];
    self.visibleView.backgroundView = self.view;
    self.visibleView.separatorEffect = [UIVibrancyEffect effectForBlurEffect:blurEffect];
}

-(void)didTap:(UIGestureRecognizer *)gesture
{
    if (gesture.state == UIGestureRecognizerStateEnded)
        [self hideMenuSideView];
}

- (CGRect)getFrameSideMenuHide {
    CGFloat x = (self.menuSidePosition == Position_Left) ? -self.width : ([[UIScreen mainScreen] bounds].size.width+self.width);
    return CGRectMake(x, 0, self.width, self.visibleView.frame.size.height);
}

- (CGRect)getFrameSideMenuShow {
    CGFloat x = (self.menuSidePosition == Position_Left) ? 0 : ([[UIScreen mainScreen] bounds].size.width - self.width);
    return CGRectMake(x, 0, self.width, self.visibleView.frame.size.height);
}

#pragma mark - show/hide view
- (void)showMenuSideView {
    [self initView];
    [self.currentViewController.view addSubview:self.overlayView];
    [self.currentViewController.view addSubview:self.visibleView];
    
    NSLog(@"%f", self.view.frame.origin.x);
    CGRect frame = [self getFrameSideMenuShow];
    [UIView animateWithDuration:0.5 animations:^{
        self.visibleView.frame = frame;
        self.overlayView.alpha = 1;
    } completion:^(BOOL finished) {
        NSLog(@"show");
    }];
}

- (void)hideMenuSideView {
    CGRect frame = [self getFrameSideMenuHide];
    [UIView animateWithDuration:0.5 animations:^{
        self.visibleView.frame = frame;
        self.overlayView.alpha = 0;
        
    } completion:^(BOOL finished) {
        [self.overlayView removeFromSuperview];
        [self.overlayView removeGestureRecognizer:self.tapGesture];
        [self.view removeFromSuperview];
        
        self.view= nil;
        self.overlayView = nil;
        self.tapGesture = nil;
        
        NSLog(@"Hide");
    }];
}

@end

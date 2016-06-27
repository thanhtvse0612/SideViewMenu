//
//  SideMenuView.h
//  SliderView
//
//  Created by Van Thanh Tran on 6/26/16.
//  Copyright © 2016 Van Thanh Tran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef enum : NSUInteger {
    Position_Left,
    Position_Right,
} MenuSidePosition;


@interface SideMenuView : NSObject
@property (assign, nonatomic) MenuSidePosition menuSidePosition;
@property (strong, nonatomic) UITableView *visibleView;
@property (nonatomic, assign) UIBlurEffectStyle blurEffectStyle;
@property (nonatomic, strong) UIVisualEffectView *view;
@property (assign, nonatomic) float width;
@property (assign, nonatomic) BOOL enableOverlay;
@property (assign, nonatomic) BOOL hideOnSelection;
@property (strong, nonatomic) UIViewController *currentViewController;


-(instancetype)initWithView:(UITableView *)view;
-(instancetype)initWithWidth:(CGFloat)width andDirection:(MenuSidePosition)direction andView:(UITableView *)view andCurretController:(UIViewController *)controller;
- (void)showMenuSideView ;
- (void)hideMenuSideView ;

@end

//
//  AppDelegate.h
//  SliderView
//
//  Created by Van Thanh Tran on 6/26/16.
//  Copyright © 2016 Van Thanh Tran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *navigationController;
@property (strong, nonatomic) MainViewController *mainViewController;

@end


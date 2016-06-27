//
//  MainViewController.m
//  SliderView
//
//  Created by Van Thanh Tran on 6/26/16.
//  Copyright © 2016 Van Thanh Tran. All rights reserved.
//

#import "MainViewController.h"
#import "AppDelegate.h"
#import "SideMenuView.h"
#import "DemoView.h"
#import "DemoTableView.h"

@interface MainViewController ()
@property (strong, nonatomic) SideMenuView *sideMenuView;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *menuSideButton = [[UIBarButtonItem alloc] initWithTitle:@"Menu" style:UIBarButtonItemStylePlain target:self action:@selector(showMenu)];
    self.navigationItem.leftBarButtonItem = menuSideButton;
    
    DemoView *demoView = [[DemoView alloc] initWithFrame:CGRectMake(0, 0, 220, [UIScreen mainScreen].bounds.size.height)];
    DemoTableView *demoTableView = [[DemoTableView alloc] initWithFrame:CGRectMake(0, 0, 220, [UIScreen mainScreen].bounds.size.height)];
    
    self.sideMenuView = [[SideMenuView alloc] initWithWidth:220 andDirection:Position_Left andView:demoTableView andCurretController:self.navigationController];
    self.sideMenuView.blurEffectStyle =UIBlurEffectStyleExtraLight;
}

- (void)initSideMenuView {

}

- (void)showMenu {
    [self.sideMenuView showMenuSideView];
}


@end

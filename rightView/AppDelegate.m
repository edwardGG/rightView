//
//  AppDelegate.m
//  rightView
//
//  Created by Edward on 16/8/6.
//  Copyright © 2016年 Edward. All rights reserved.
//

#import "AppDelegate.h"
#import "REFrostedViewController.h"
#import "REFrostedContainerViewController.h"
#import "ViewController.h"
#import "BViewController.h"
#import "CViewController.h"
#import "DViewController.h"
#import "EViewController.h"
#import "NaviViewController.h"
#import "TransitionAnimator.h"
@interface AppDelegate ()
@property (nonatomic, copy) NSArray *viewControllers;

@end

@implementation AppDelegate
- (void)panGestureRecognized:(UIPanGestureRecognizer *)sender
{
//    [self.frostedViewController panGestureRecognized:sender];
}

-(BOOL)tabBarController:(FSVerticalTabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    if ([_viewControllers indexOfObject:viewController] == 4) {
        return NO;
    }
    return YES;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
   
    
    
    // Create content and menu controllers
    //
    NaviViewController *navigationController = [[NaviViewController alloc] initWithRootViewController:[[ViewController alloc] init]];
    BViewController *BmenuController = [[BViewController alloc] init];
    UINavigationController *Bnavi = [[UINavigationController alloc] initWithRootViewController:BmenuController];
//    Bnavi.delegate = self;
    CViewController *CmenuController = [[CViewController alloc] init];
    DViewController *DmenuController = [[DViewController alloc] init];
    EViewController *EmenuController = [[EViewController alloc] init];
//    UITabBarController *tab = [[UITabBarController alloc] init];
    
    
    FSVerticalTabBarController *tabVC = [[FSVerticalTabBarController alloc] init];
    self.viewControllers = @[Bnavi, CmenuController, DmenuController, EmenuController];
    [tabVC setViewControllers:_viewControllers animated:YES];
    tabVC.tabBar.backgroundImage = [UIImage imageNamed:@"1"];
    tabVC.delegate = self;
    
    
    
//    tab.viewControllers = @[BmenuController, CmenuController, DmenuController, EmenuController];
    Bnavi.tabBarItem.title = @"BVC";
//    BmenuController.tabBarItem.title = @"BVC";
    CmenuController.tabBarItem.title = @"CVC";
    DmenuController.tabBarItem.title = @"DVC";
    EmenuController.tabBarItem.title = @"EVC";
    // Create frosted view controller
    //
    REFrostedViewController *frostedViewController = [[REFrostedViewController alloc] initWithContentViewController:navigationController menuViewController:tabVC];
    frostedViewController.direction = REFrostedViewControllerDirectionRight;
    frostedViewController.title = @"frostedViewController";
    frostedViewController.liveBlur = NO;
    frostedViewController.blurRadius = 0.f;
    
    // Make it a root controller
    //
    self.window.rootViewController = frostedViewController;
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (NSArray *)viewControllers {
	if(_viewControllers == nil) {
		_viewControllers = [[NSArray alloc] init];
	}
	return _viewControllers;
}

@end

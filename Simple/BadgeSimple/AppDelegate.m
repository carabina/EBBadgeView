//
//  AppDelegate.m
//  BadgeSimple
//
//  Created by EasyBenefit on 16/5/7.
//  Copyright © 2016年 EasyBenefit. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "EBBadgeView.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] init];
    [self.window setFrame:[UIScreen mainScreen].bounds];
    UITabBarController *tabbarVc = [[UITabBarController alloc] init];
    FirstViewController *firstVc = [[FirstViewController alloc] init];
    firstVc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"first" image:[UIImage imageNamed:@"first"] tag:1];
    
    SecondViewController *secondVc = [[SecondViewController alloc] init];
    secondVc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"second" image:[UIImage imageNamed:@"second"] tag:2];
    
    tabbarVc.viewControllers = [NSArray arrayWithObjects:[[UINavigationController alloc] initWithRootViewController:firstVc],[[UINavigationController alloc] initWithRootViewController:secondVc], nil];
    self.window.rootViewController = tabbarVc;
    EBBadgeModel *badgeModel = [EBBadgeModel badgeModelWithType:EBBadgeViewTypePoint];
    [secondVc.tabBarController.tabBar eb_showWithBadgeModel:badgeModel atIndex:1];
    
    [self.window makeKeyAndVisible];
    
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

@end

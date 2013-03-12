//
//  SVAppDelegate.m
//  SplitViewApp
//
//  Created by Tim Duckett on 04/01/2012.
//  Copyright (c) 2012 Charismatic Megafauna Ltd. All rights reserved.
//

#import "SVAppDelegate.h"

#import "LeftTableViewController.h"
#import "RightDetailViewController.h"

@implementation SVAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.

    // Create left view controller
    LeftTableViewController *leftTableVC = [[LeftTableViewController alloc] initWithNibName:@"LeftTableViewController" bundle:nil];
    UINavigationController *leftNavController = [[UINavigationController alloc] initWithRootViewController:leftTableVC];
    
    // Create right view controlller
    RightDetailViewController *rightDetailVC = [[RightDetailViewController alloc] initWithNibName:@"RightDetailViewController" bundle:nil];
    UINavigationController *rightNavController = [[UINavigationController alloc] initWithRootViewController:rightDetailVC];
    
    // Set left view controller's delegate
    leftTableVC.delegate = rightDetailVC;

    // Create split view controller and load its view controllers
    self.splitViewController = [[UISplitViewController alloc] init];
    NSArray *viewControllers = [[NSArray alloc] initWithObjects:leftNavController, rightNavController, nil];
    
    self.splitViewController.delegate = rightDetailVC;
    self.splitViewController.viewControllers = viewControllers;
    
    // Add the split view controller to the view
    // Deprecated in iOS6
    //[self.window addSubview:_splitViewController.view];
    
    // For iOS6, add the split view controller as the root view controller
    self.window.rootViewController = self.splitViewController;
    
    // Set up the window and return
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end

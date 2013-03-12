//
//  SVAppDelegate.h
//  SplitViewApp
//
//  Created by Tim Duckett on 04/01/2012.
//  Copyright (c) 2012 Charismatic Megafauna Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SplitViewController;

@interface SVAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UISplitViewController *splitViewController;

@end

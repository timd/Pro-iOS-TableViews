//
//  STAppDelegate.h
//  SimpleTable
//
//  Created by TimD on 05/02/2012.
//  Copyright (c) 2012 Tim Duckett / Charismatic Megafauna Ltd. Some rights reserved.
//

#import <UIKit/UIKit.h>

@class STViewController;

@interface STAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) STViewController *viewController;

@end

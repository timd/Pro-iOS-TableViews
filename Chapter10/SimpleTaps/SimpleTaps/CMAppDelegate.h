//
//  CMAppDelegate.h
//  SimpleTaps
//
//  Created by TimD on 05/02/2012.
//  Copyright (c) 2012 Tim Duckett / Charismatic Megafauna Ltd. Some rights reserved.
//  See License.txt for licensing information.

#import <UIKit/UIKit.h>

@class CMViewController;

@interface CMAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) CMViewController *viewController;

@end

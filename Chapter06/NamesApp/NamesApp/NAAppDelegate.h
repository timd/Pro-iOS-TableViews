//
//  NAAppDelegate.h
//  NamesApp
//
//  Created by Tim Duckett on 04/02/2012.
//  Copyright (c) 2012 Tim Duckett / Charismatic Megafauna Ltd.
//  See license.txt for licensing information.

#import <UIKit/UIKit.h>

@class NAViewController;

@interface NAAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) NAViewController *viewController;

@end

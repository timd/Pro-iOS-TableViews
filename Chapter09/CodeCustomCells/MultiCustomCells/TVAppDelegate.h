//
//  TVAppDelegate.h
//  MultiCustomCells
//
//  Created by Tim Duckett on 20/12/2011.
//  Copyright (c) 2011 Charismatic Megafauna Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TVViewController;

@interface TVAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) TVViewController *viewController;

@end

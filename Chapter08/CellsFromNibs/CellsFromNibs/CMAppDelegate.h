//
//  CMAppDelegate.h
//  CellsFromNibs
//
//  Created by Tim Duckett on 19/12/2011.
//  Copyright (c) 2011 Charismatic Megafauna Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CMViewController;

@interface CMAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) CMViewController *viewController;

@end

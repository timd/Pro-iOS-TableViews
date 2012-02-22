//
//  BNAppDelegate.h
//  BabyNames
//
//  Created by Tim Duckett on 04/02/2012.
//  Copyright (c) 2012 Tim Duckett / Charismatic Megafauna Ltd
//  See license.txt for licensing information.
//

#import <UIKit/UIKit.h>

@class BNViewController;

@interface BNAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) BNViewController *viewController;

@property (nonatomic, strong) NSMutableArray *tableData;



@end

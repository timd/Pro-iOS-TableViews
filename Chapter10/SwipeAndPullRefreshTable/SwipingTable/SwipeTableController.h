//
//  SwipeTableController.h
//  SwipingTable
//
//  Created by Tim Duckett on 13/12/2011.
//  Copyright (c) 2011 Charismatic Megafauna Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SwipeCellProtocol.h"

@interface SwipeTableController : UITableViewController <SwipeCellProtocol>

@property (nonatomic, strong) NSIndexPath *swipedCell;

@property (nonatomic, strong) UIWindow *mainWindow;
@property (nonatomic, strong) UIActivityIndicatorView *activityIndicator;
@property (nonatomic, strong) UIView *activityView;

-(void)didSwipeRightInCellWithIndexPath:(NSIndexPath *)indexPath;
-(void)didSwipeLeftInCellWithIndexPath:(NSIndexPath *)indexPath;

-(void)displayActivitySpinner;
-(void)removeActivitySpinner;

@end

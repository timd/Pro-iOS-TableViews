//
//  SwipeCell.h
//  SwipingTable
//
//  Created by Tim Duckett on 13/12/2011.
//  Copyright (c) 2011 Charismatic Megafauna Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SwipeCellProtocol.h"

@interface SwipeCell : UITableViewCell

@property (nonatomic, strong) UIView *swipeView;
@property (nonatomic, strong) UIView *topView;

@property (nonatomic, retain) NSIndexPath *indexPath;
@property (nonatomic, assign) id <SwipeCellProtocol> delegate;

-(IBAction)didSwipeRightInCell:(id)sender;
-(IBAction)didSwipeLeftInCell:(id)sender;

@end

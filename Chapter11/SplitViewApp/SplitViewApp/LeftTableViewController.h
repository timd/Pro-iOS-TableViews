//
//  LeftTableViewController.h
//  SplitViewApp
//
//  Created by Tim Duckett on 04/01/2012.
//  Copyright (c) 2012 Charismatic Megafauna Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UpdateSplitDetailViewProtocol.h"

@interface LeftTableViewController : UITableViewController

@property (nonatomic, weak) id <UpdateSplitDetailViewProtocol> delegate;

@end

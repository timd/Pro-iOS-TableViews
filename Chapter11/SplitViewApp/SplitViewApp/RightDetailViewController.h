//
//  RightDetailViewController.h
//  SplitViewApp
//
//  Created by Tim Duckett on 04/01/2012.
//  Copyright (c) 2012 Charismatic Megafauna Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UpdateSplitDetailViewProtocol.h"

@interface RightDetailViewController : UIViewController <UISplitViewControllerDelegate, UpdateSplitDetailViewProtocol>

@property (nonatomic, strong) IBOutlet UILabel *statusLabel;

@end

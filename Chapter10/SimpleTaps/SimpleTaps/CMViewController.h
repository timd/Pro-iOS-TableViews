//
//  CMViewController.h
//  SimpleTaps
//
//  Created by TimD on 05/02/2012.
//  Copyright (c) 2012 Tim Duckett / Charismatic Megafauna Ltd. Some rights reserved.
//  See License.txt for licensing information.


#import <UIKit/UIKit.h>

@interface CMViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *tableData;

-(void)didTapButtonInCell;

@end

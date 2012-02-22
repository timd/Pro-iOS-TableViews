//
//  CMViewController.h
//  EditingApp
//
//  Created by TimD on 05/02/2012.
//  Copyright (c) Tim Duckett / Charismatic Megafauna Ltd. Some rights reserved.
//  See License.txt for licensing information.


#import <UIKit/UIKit.h>

@interface CMViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *tableData;
@property (strong, nonatomic) IBOutlet UITableView *theTableView;

@end

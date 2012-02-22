//
//  BNViewController.h
//  BabyNames
//
//  Created by Tim Duckett on 04/02/2012.
//  Copyright (c) 2012 Tim Duckett / Charismatic Megafauna Ltd
//  See license.txt for licensing information.
//

#import <UIKit/UIKit.h>

@interface BNViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *tableData;

@property (strong, nonatomic) IBOutlet UITableView *theTableView;

@end

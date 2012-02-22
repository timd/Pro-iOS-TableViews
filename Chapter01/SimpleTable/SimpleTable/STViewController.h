//
//  STViewController.h
//  SimpleTable
//
//  Created by TimD on 05/02/2012.
//  Copyright (c) 2012 Tim Duckett / Charismatic Megafauna Ltd. Some rights reserved.
//

#import <UIKit/UIKit.h>

@interface STViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *tableData; // holds the table data
@property (nonatomic) int cellCount;

@end

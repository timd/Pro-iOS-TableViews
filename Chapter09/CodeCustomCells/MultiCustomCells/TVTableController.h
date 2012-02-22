//
//  TVTableController.h
//  MultiCustomCells
//
//  Created by Tim Duckett on 20/12/2011.
//  Copyright (c) 2011 Charismatic Megafauna Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TVTableController : UITableViewController

@property (nonatomic, retain) NSMutableArray *tableData;
@property (nonatomic, retain) NSMutableArray *phraseData;

@property (nonatomic, strong) NSString *cellIdentifier;

@end

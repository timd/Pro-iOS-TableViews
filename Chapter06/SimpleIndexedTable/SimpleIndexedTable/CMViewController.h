//
//  CMViewController.h
//  SimpleIndexedTable
//
//  Created by Tim Duckett on 04/02/2012.
//  Copyright (c) 2012 Tim Duckett / Charismatic Megafauna Ltd.
//  See license.txt for licensing information.

#import <UIKit/UIKit.h>

@interface CMViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *tableData;
@property (nonatomic, strong) NSArray *indexTitlesArray;

@end

//
//  NAViewController.h
//  NamesApp
//
//  Created by Tim Duckett on 04/02/2012.
//  Copyright (c) 2012 Tim Duckett / Charismatic Megafauna Ltd.
//  See license.txt for licensing information.

#import <UIKit/UIKit.h>

@interface NAViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *tableData;
@property (nonatomic, strong) UILocalizedIndexedCollation *collation;
@property (nonatomic, strong) NSMutableArray *outerArray;
@property (nonatomic, strong) NSArray *indexTitlesArray;

@end

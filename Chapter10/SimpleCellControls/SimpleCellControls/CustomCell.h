//
//  CustomCell.h
//  SimpleCellControls
//
//  Created by Tim Duckett on 03/01/2012.
//  Copyright (c) 2012 Charismatic Megafauna Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell

@property (nonatomic, strong) NSIndexPath *indexPath;

-(void)didTapButtonInCell;

@end

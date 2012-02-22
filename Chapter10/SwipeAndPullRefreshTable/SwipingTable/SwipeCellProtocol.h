//
//  SwipeCellProtocol.h
//  SwipingTable
//
//  Created by Tim Duckett on 03/01/2012.
//  Copyright (c) 2012 Charismatic Megafauna Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SwipeCellProtocol <NSObject>

-(void)didSwipeRightInCellWithIndexPath:(NSIndexPath *)indexPath;
-(void)didSwipeLeftInCellWithIndexPath:(NSIndexPath *)indexPath;

@end

//
//  EvenCell.h
//  MultiCustomCells
//
//  Created by Tim Duckett on 20/12/2011.
//  Copyright (c) 2011 Charismatic Megafauna Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EvenCell : UITableViewCell

@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *cellTitleLabel;
@property (nonatomic, strong) UILabel *mainContentLabel;
@property (nonatomic, strong) UILabel *otherContentLabel;

@end

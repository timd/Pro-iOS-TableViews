//
//  OddCell.m
//  MultiCustomCells
//
//  Created by Tim Duckett on 20/12/2011.
//  Copyright (c) 2011 Charismatic Megafauna Ltd. All rights reserved.
//

#import "OddCell.h"

@implementation OddCell

@synthesize cellTitleLabel  = _cellTitleLabel;
@synthesize cellContentLabel = _cellContentLabel;
@synthesize iconView = _iconView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // background view
        UIImageView *theBackgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"corkboard"]];
        self.backgroundView = theBackgroundView;
        
        // cellTitle label
        _cellTitleLabel = [[UILabel alloc] init];
        _cellTitleLabel.frame = CGRectMake(92, 13, 208, 32);
        [_cellTitleLabel setBackgroundColor:[UIColor clearColor]];
        [_cellTitleLabel setFont:[UIFont fontWithName:@"Futura-CondensedExtraBold" size:23]];
        [_cellTitleLabel setTextColor:[UIColor blackColor]];
        
        // cellContent label
        _cellContentLabel = [[UILabel alloc] init];
        _cellContentLabel.frame = CGRectMake(92, 42, 208, 21);
        [_cellContentLabel setBackgroundColor:[UIColor clearColor]];
        [_cellContentLabel setFont:[UIFont fontWithName:@"Futura-Medium" size:13]];
        [_cellContentLabel setTextColor:[UIColor blackColor]];
        
        // iconView
        _iconView = [[UIImageView alloc] init];
        _iconView.frame = CGRectMake(20, 17, 58, 36);
        
        // Set up contentView
        [self.contentView addSubview:_cellTitleLabel];
        [self.contentView addSubview:_cellContentLabel];
        [self.contentView addSubview:_iconView];

    }

    return self;
    
}

-(void)drawRect:(CGRect)rect {
    
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    if (selected) {
        
        UIImageView *theSelectedView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bluePrint"]];
        self.selectedBackgroundView = theSelectedView;
        
        [_cellTitleLabel setTextColor:[UIColor redColor]];
        
    } else {

        self.selectedBackgroundView = nil;
        [_cellTitleLabel setTextColor:[UIColor blackColor]];        
        
    }
}

@end

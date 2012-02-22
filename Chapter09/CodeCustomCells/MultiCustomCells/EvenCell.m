//
//  EvenCell.m
//  MultiCustomCells
//
//  Created by Tim Duckett on 20/12/2011.
//  Copyright (c) 2011 Charismatic Megafauna Ltd. All rights reserved.
//

#import "EvenCell.h"

@implementation EvenCell

@synthesize iconView = _iconView;
@synthesize cellTitleLabel = _cellTitleLabel;
@synthesize mainContentLabel = _mainContentLabel;
@synthesize otherContentLabel = _otherContentLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        // background view
        UIImageView *theBackgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"gingham"]];
        self.backgroundView = theBackgroundView;
        
        // cellTitle label
        _cellTitleLabel = [[UILabel alloc] init];
        _cellTitleLabel.frame = CGRectMake(13, 14, 173, 21);
        [_cellTitleLabel setBackgroundColor:[UIColor clearColor]];
        [_cellTitleLabel setFont:[UIFont fontWithName:@"Baskerville-SemiBold" size:27]];
        [_cellTitleLabel setTextColor:[UIColor blackColor]];
        
        // mainContent label
        _mainContentLabel = [[UILabel alloc] init];
        _mainContentLabel.frame = CGRectMake(110, 2, 147, 21);
        [_mainContentLabel setBackgroundColor:[UIColor clearColor]];
        [_mainContentLabel setFont:[UIFont fontWithName:@"Baskerville-Italic" size:15]];
        [_mainContentLabel setTextColor:[UIColor blueColor]];

        // mainContent label
        _otherContentLabel = [[UILabel alloc] init];
        _otherContentLabel.frame = CGRectMake(110, 26, 147, 21);
        [_otherContentLabel setBackgroundColor:[UIColor clearColor]];
        [_otherContentLabel setFont:[UIFont fontWithName:@"Baskerville" size:15]];
        [_otherContentLabel setTextColor:[UIColor blueColor]];

        // iconView
        _iconView = [[UIImageView alloc] init];
        _iconView.frame = CGRectMake(265, 2, 45, 45);
        
        // Set up contentView
        [self.contentView addSubview:_cellTitleLabel];
        [self.contentView addSubview:_mainContentLabel];
        [self.contentView addSubview:_otherContentLabel];
        [self.contentView addSubview:_iconView];
        
    }
    
    return self;
    
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

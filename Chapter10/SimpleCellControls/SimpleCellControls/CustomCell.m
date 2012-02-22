//
//  CustomCell.m
//  SimpleCellControls
//
//  Created by Tim Duckett on 03/01/2012.
//  Copyright (c) 2012 Charismatic Megafauna Ltd. All rights reserved.
//

#import "CustomCell.h"

    
@implementation CustomCell

@synthesize indexPath;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        UIButton *theButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [theButton setFrame:CGRectMake(0, 0, 75, 30)];
        [theButton addTarget:self action:@selector(didTapButtonInCell) forControlEvents:UIControlEventTouchUpInside];
        
        self.accessoryView = theButton;
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setIndexPath:(NSIndexPath *)theIndexPath {
    
    indexPath = theIndexPath;
    
    UILabel *theLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 7, 200, 25)];
    [theLabel setFont:[UIFont systemFontOfSize:18]];
    [theLabel setText:[NSString stringWithFormat:@"Row %d", self.indexPath.row]];
    
    [self.contentView addSubview:theLabel];
    
    UIButton *theButton = (UIButton *)self.accessoryView;
    [theButton setTitle:@"Tap me!" forState:UIControlStateNormal];
    
}

-(void)didTapButtonInCell {

    NSString *messageString = [NSString stringWithFormat:@"Button at section %d row %d was tapped.", self.indexPath.section, self.indexPath.row];

    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Button tapped!" message:messageString delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];

    [alert show];
    
}

@end

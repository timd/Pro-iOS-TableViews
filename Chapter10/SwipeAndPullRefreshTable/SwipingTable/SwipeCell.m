//
//  SwipeCell.m
//  SwipingTable
//
//  Created by Tim Duckett on 13/12/2011.
//  Copyright (c) 2011 Charismatic Megafauna Ltd. All rights reserved.
//

#import "SwipeCell.h"

@implementation SwipeCell

@synthesize swipeView = _swipeView;
@synthesize topView = _topView;
@synthesize indexPath = _indexPath;
@synthesize delegate;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code

        // Create the top view
        _topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.contentView.frame.size.width, 80)];
        [_topView setBackgroundColor:[UIColor whiteColor]];
        
        // Create the top label
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, 150, 40)];
        [label setFont:[UIFont fontWithName:@"Zapfino" size:18]];
        [label setTextColor:[UIColor blackColor]];
        [label setText:@"Swipe me!"];
        [_topView addSubview:label];
        
        // Create the top image
        UIImageView *pointImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"point"]];
        
        CGFloat pointImageXposition = self.contentView.frame.size.width - 160;
        [pointImage setFrame:CGRectMake(pointImageXposition, 18, 144, 44)];
        [_topView addSubview:pointImage];
        
        // Create the swipe view
        _swipeView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.contentView.frame.size.width, 80)];
        [_swipeView setBackgroundColor:[UIColor darkGrayColor]];
        
        // Create the swipe label
        UILabel *haveSwipedlabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 25, 200, 30)];
        [haveSwipedlabel setFont:[UIFont fontWithName:@"GillSans-Bold" size:18]];
        [haveSwipedlabel setTextColor:[UIColor whiteColor]];
        [haveSwipedlabel setBackgroundColor:[UIColor darkGrayColor]];
        [haveSwipedlabel setText:@"I've been swiped!"];
        [_swipeView addSubview:haveSwipedlabel];
        
        // Add views to contentView
        [self.contentView addSubview:_swipeView];
        [self.contentView addSubview:_topView];
        
        // Create the gesture recognizers
        UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipeRightInCell:)];
        [swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
        
        UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipeLeftInCell:)];
        [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
        
        [self addGestureRecognizer:swipeRight];
        [self addGestureRecognizer:swipeLeft];
        
        // Prevent selection highlighting
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];

    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(IBAction)didSwipeRightInCell:(id)sender {
    
    // Inform the delegate of the right swipe
    [delegate didSwipeRightInCellWithIndexPath:_indexPath];
    
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];

    // Swipe top view left
    [UIView animateWithDuration:1.0 animations:^{
        
        [_topView setFrame:CGRectMake(self.contentView.frame.size.width, 0, self.contentView.frame.size.width, 80)];
        
    } completion:^(BOOL finished) {
        
        // Bounce lower view
        [UIView animateWithDuration:0.15 animations:^{
            
            [_swipeView setFrame:CGRectMake(10, 0, self.contentView.frame.size.width, 80)];
            
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:0.15 animations:^{
                [_swipeView setFrame:CGRectMake(0, 0, self.contentView.frame.size.width, 80)];
            }];
        }];
    }];
    
}

-(IBAction)didSwipeLeftInCell:(id)sender {
    
    // Inform the delegate of the left swipe
    [delegate didSwipeLeftInCellWithIndexPath:_indexPath];
    
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    
    [UIView animateWithDuration:1.0 animations:^{
        [_topView setFrame:CGRectMake(-10, 0, self.contentView.frame.size.width, 80)];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.15 animations:^{
            [_topView setFrame:CGRectMake(0, 0, self.contentView.frame.size.width, 80)];
        }];
    }];
    
}

@end

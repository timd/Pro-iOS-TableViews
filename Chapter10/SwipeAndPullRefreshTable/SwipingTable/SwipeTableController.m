//
//  SwipeTableController.m
//  SwipingTable
//
//  Created by Tim Duckett on 13/12/2011.
//  Copyright (c) 2011 Charismatic Megafauna Ltd. All rights reserved.
//

#import "SwipeTableController.h"
#import "SwipeCell.h"

@implementation SwipeTableController

@synthesize swipedCell = _swipedCell;

@synthesize activityView = _activityView;
@synthesize activityIndicator = _activityIndicator;
@synthesize mainWindow = _mainWindow;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.swipedCell = nil;
    self.mainWindow = nil;
    self.activityIndicator = nil;
    self.activityView = nil;
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    _mainWindow = [[UIApplication sharedApplication] keyWindow];
    [_mainWindow setBackgroundColor:[UIColor whiteColor]];

}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
//    return (interfaceOrientation == UIInterfaceOrientationPortrait);
    return YES;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"";
    
    SwipeCell *cell = (SwipeCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[SwipeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.indexPath = indexPath;
    cell.delegate = self;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
/*
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    UIView *swipeView = [cell.contentView viewWithTag:1000];
    
    [swipeView setHidden:NO];
    
    [UIView animateWithDuration:1.0 animations:^{
        [swipeView setFrame:CGRectMake(0, 0, 320, 44)];
    }];
*/
}

#pragma mark -
#pragma mark SwipeCellDelegate methods

-(void)didSwipeRightInCellWithIndexPath:(NSIndexPath *)indexPath{

    if ([_swipedCell compare:indexPath] != NSOrderedSame) {
        
        // Unswipe the currently swiped cell
        SwipeCell *currentlySwipedCell = (SwipeCell *)[self.tableView cellForRowAtIndexPath:_swipedCell];
        [currentlySwipedCell didSwipeLeftInCell:self];
        
    }

    // Set the _swipedCell property
    _swipedCell = indexPath;
    
}

-(void)didSwipeLeftInCellWithIndexPath:(NSIndexPath *)indexPath {
    
    if ([_swipedCell compare:indexPath] == NSOrderedSame) {
        
        _swipedCell = nil;
        
    }
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (_swipedCell) {
        
        SwipeCell *currentlySwipedCell = (SwipeCell *)[self.tableView cellForRowAtIndexPath:_swipedCell];
        [currentlySwipedCell didSwipeLeftInCell:self];
        
    }
    
}

#pragma mark -
#pragma mark Pull to refresh methods

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
    NSLog(@"table began dragging");
    
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    
    NSLog(@"table did end dragging");
    
    CGFloat contentOffsetY = scrollView.contentOffset.y;
    
    NSLog(@"ContentOffset = %f", contentOffsetY);
    
    if (contentOffsetY < -70.0) {
        [self displayActivitySpinner];
    }
    
}

-(void)displayActivitySpinner {
    
    _activityView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 60)];
    [_activityView setBackgroundColor:[UIColor whiteColor]];
    
    _activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [_activityIndicator setFrame:CGRectMake(145, 20, 30, 30)];
    [_activityIndicator startAnimating];
    [_activityView addSubview:_activityIndicator];
    
    [_mainWindow addSubview:_activityView];
    
    [UIView animateWithDuration:0.25 animations:^{
        [self.tableView setFrame:CGRectMake(0, 60, 320, 480)];
    } completion:^(BOOL finished) {
        // No completion
        [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(removeActivitySpinner) userInfo:nil repeats:NO];
    }];
}

-(void)removeActivitySpinner {
    
    [_activityIndicator stopAnimating];
    [_activityView removeFromSuperview];
    
    [UIView animateWithDuration:0.250 animations:^{
        
        CGRect currentTableRect = self.tableView.frame;
        [self.tableView setFrame:CGRectMake(currentTableRect.origin.x, currentTableRect.origin.y - 40, currentTableRect.size.width, currentTableRect.size.height)];
        
    }];
    
}

@end

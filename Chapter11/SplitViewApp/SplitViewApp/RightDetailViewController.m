//
//  RightDetailViewController.m
//  SplitViewApp
//
//  Created by Tim Duckett on 04/01/2012.
//  Copyright (c) 2012 Charismatic Megafauna Ltd. All rights reserved.
//

#import "RightDetailViewController.h"

@implementation RightDetailViewController

@synthesize statusLabel = _statusLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
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
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.statusLabel = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}


#pragma mark -
#pragma mark UISplitViewControllerDelegate

-(void)splitViewController:(UISplitViewController *)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)pc {
    
    // Set up the bar button when the list view disappears
    [barButtonItem setTitle:@"Show list"];
    self.navigationItem.leftBarButtonItem = barButtonItem;
}

-(void)splitViewController:(UISplitViewController *)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem {

    // Hide the bar button when the list view reappears
    self.navigationItem.leftBarButtonItem = nil;
    
}

#pragma mark -
#pragma mark UpdateSplitDetailViewProtocol

-(void)updateDetailViewWith:(NSString *)detail {
    
    // Respond to the delegate method being called
    
    NSLog(@"updateDetailViewWith:%@ called", detail);
    
    _statusLabel.text = [NSString stringWithFormat:@"%@ was selected", detail];
    
}

@end



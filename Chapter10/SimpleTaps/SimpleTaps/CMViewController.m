//
//  CMViewController.m
//  SimpleTaps
//
//  Created by TimD on 05/02/2012.
//  Copyright (c) 2012 Tim Duckett / Charismatic Megafauna Ltd. Some rights reserved.
//  See License.txt for licensing information.


#import "CMViewController.h"

@implementation CMViewController

@synthesize tableData;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - Table view methods

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.tableData count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"cellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [self.tableData objectAtIndex:indexPath.row];
    
/*    
    // Create and add the button to the cell
    UIButton *theButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [theButton setFrame:CGRectMake(235, 7, 75, 30)];
    [theButton setTitle:@"Tap me!" forState:UIControlStateNormal];
    [theButton addTarget:self action:@selector(didTapButtonInCell) forControlEvents:UIControlEventTouchUpInside];
 
    [cell.contentView addSubview:theButton];

 */    

    // Create and add the button to the accessory view
    UIButton *theButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    // Set the X and Y coords of the button to 0
    [theButton setFrame:CGRectMake(0, 0, 75, 30)];
    [theButton setTitle:@"Tap me!" forState:UIControlStateNormal];
    [theButton addTarget:self action:@selector(didTapButtonInCell) forControlEvents:UIControlEventTouchUpInside];
    
    // Add the button to the accessory view
    cell.accessoryView = theButton;
    
    return cell;
}

-(void)didTapButtonInCell {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Something happened!" 
                                                    message:@"A button was tapped" 
                                                   delegate:nil 
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.tableData = [[NSArray alloc] initWithObjects:@"One", @"Two", @"Three", @"Four", @"Five", nil];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.tableData = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
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
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end

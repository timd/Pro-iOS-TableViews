//
//  STViewController.m
//  SimpleTable
//
//  Created by TimD on 05/02/2012.
//  Copyright (c) 2012 Tim Duckett / Charismatic Megafauna Ltd. Some rights reserved.
//

#import "STViewController.h"

@implementation STViewController

@synthesize tableData;
@synthesize cellCount;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.tableData count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [self.tableData objectAtIndex:indexPath.row];
    
    return cell;
    
}

#pragma mark - UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"Table row %d has been tapped", indexPath.row);
    
    NSString *messageString = [NSString stringWithFormat:@"You tapped row %d", indexPath.row];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Row tapped" message:messageString delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    
    [alert show];
    
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Create the array to hold the table data
    self.tableData = [[NSMutableArray alloc] init];
    
    // Create and add 10 data items to the table data array
    for (NSUInteger i=0; i<10; i++) {
        
        // The cell will contain a string "Item X"
        NSString *dataString = [NSString stringWithFormat:@"Item %d", i];
        
        // Here the new string is added to the end of the array
        [self.tableData addObject:dataString];
        
    }
    
    // Print out the contents of the array into the log
    NSLog(@"The tableData array contains %@", self.tableData);
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.tableData = nil;
    self.cellCount = nil;
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

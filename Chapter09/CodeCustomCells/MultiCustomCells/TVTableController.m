//
//  TVTableController.m
//  MultiCustomCells
//
//  Created by Tim Duckett on 20/12/2011.
//  Copyright (c) 2011 Charismatic Megafauna Ltd. All rights reserved.
//

#import "TVTableController.h"

#import "OddCell.h"
#import "EvenCell.h"

#define kOddCellIdentifier @"OddCellIdentifier"
#define kEvenCellIdentifier @"EvenCellIdentifier"

@implementation TVTableController

@synthesize tableData = _tableData;
@synthesize phraseData = _phraseData;
@synthesize cellIdentifier = _cellIdentifier;

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
    
    _tableData = [[NSMutableArray alloc] init];
    _phraseData = [[NSMutableArray alloc] init];
    
    NSArray *firstLatinWords = [NSArray arrayWithObjects:@"Lorem", @"Ipsum", @"Dolor", @"Amet", @"Consectetur", @"Adipiscing", @"Elit", @"Quisque", nil];
    NSArray *secondLatinWords = [NSArray arrayWithObjects:@"vivamus", @"suscipit", @"ultricies", @"risus", @"in", @"consequat", @"vestibulum", @"laoreet", @"sollicitudin", @"velit", nil];
    
    for (NSInteger i=0; i < 30; i++) {

        int firstWord = arc4random() % 7;
        int secondWord = arc4random() % 9;
        int thirdWord = arc4random() % 9;
        
        [_phraseData addObject:[NSString stringWithFormat:@"%@ %@ %@", [firstLatinWords objectAtIndex:firstWord], 
                                [secondLatinWords objectAtIndex:secondWord], 
                                [secondLatinWords objectAtIndex:thirdWord]]];
        
        [_tableData addObject:[NSString stringWithFormat:@"Cell %d", i]];
    }


}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.tableData = nil;
    self.phraseData = nil;
    self.cellIdentifier =nil;
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
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
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
    return [_tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    BOOL isEvenRow = (indexPath.row % 2 == 0);
    
    NSString *cellTitle = [self.tableData objectAtIndex:indexPath.row];
    NSString *cellPhraseContent = [self.phraseData objectAtIndex:indexPath.row];

    if (isEvenRow) {
        NSString *cellIdentifier = @"EvenCell";
        EvenCell *evenCell = (EvenCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        
        if (!evenCell) {
            evenCell = [[EvenCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        
        evenCell.cellTitleLabel.text = cellTitle;
        evenCell.mainContentLabel.text = cellPhraseContent;
        evenCell.otherContentLabel.text = [NSString stringWithFormat:@"%@", [NSDate date]];
        evenCell.iconView.image = [UIImage imageNamed:@"star"];
        
        return evenCell;
        
    }
    
    NSString *cellIdentifier = @"OddCell";
    OddCell *oddCell = (OddCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!oddCell) {
        oddCell = [[OddCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    oddCell.cellTitleLabel.text = cellTitle;
    oddCell.cellContentLabel.text = cellPhraseContent;
    oddCell.iconView.image = [UIImage imageNamed:@"planet"];
    
    return oddCell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row % 2 == 0) {
        // Even row
        return 50;
    }
    
    // Odd row
    return 70;
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
    NSLog(@"did select row %d", indexPath.row);
    
}

@end

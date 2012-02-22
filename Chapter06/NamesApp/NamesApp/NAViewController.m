//
//  NAViewController.m
//  NamesApp
//
//  Created by Tim Duckett on 04/02/2012.
//  Copyright (c) 2012 Tim Duckett / Charismatic Megafauna Ltd.
//  See license.txt for licensing information.

#import "NAViewController.h"

@interface NAViewController()

-(void)configureSectionData;

@end

@implementation NAViewController

@synthesize tableData;
@synthesize collation;
@synthesize outerArray;
@synthesize indexTitlesArray;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - Table view methods

-(void)configureSectionData {
    
    NSUInteger sectionTitlesCount = [collation.sectionTitles count];
    
    self.outerArray = [NSMutableArray arrayWithCapacity:sectionTitlesCount];
    
    for (NSUInteger index = 0; index < sectionTitlesCount; index++) {
        
        NSMutableArray *array = [NSMutableArray array];
        
        [self.outerArray addObject:array];
        
    }
    
    for (NSString *nameString in tableData) {
        
        NSInteger sectionNumber = [collation sectionForObject:nameString collationStringSelector:@selector(lowercaseString)];
        
        NSMutableArray *sectionNames = [outerArray objectAtIndex:sectionNumber];
        
        [sectionNames addObject:nameString];
        
    }
    
    for (NSUInteger index = 0; index < sectionTitlesCount; index++) {
        
        NSMutableArray *namesForSection = [outerArray objectAtIndex:index];
        
        NSArray *sortedNamesForSection = [collation sortedArrayFromArray:namesForSection collationStringSelector:@selector(lowercaseString)];
        
        [self.outerArray replaceObjectAtIndex:index withObject:sortedNamesForSection];
        
    }
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.collation.sectionTitles count];
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    NSString *theLetter  = [self.collation.sectionTitles objectAtIndex:section];
    
    if (![theLetter isEqualToString:@"#"]) {
        NSString *titleString = [NSString stringWithFormat:@"Names for the letter %@", theLetter];
        return titleString;
    }
    
    return nil;
}

-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return self.collation.sectionTitles;
}

-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    return [self.collation sectionForSectionIndexTitleAtIndex:index];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    NSArray *innerArray = [self.outerArray objectAtIndex:section];
    return [innerArray count];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"cellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    // Get the inner array for this section
    NSArray *innerArray = [self.outerArray objectAtIndex:indexPath.section];
    
    // Get the name from the inner array
    NSString *theName = [innerArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = theName;
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSBundle *bundle = [NSBundle mainBundle];
    
    NSString *plistPath = [bundle pathForResource:@"Names" ofType:@"plist"];
    
    NSDictionary *namesDictionary = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    
    self.tableData = [namesDictionary objectForKey:@"names"];
    
    self.collation = [UILocalizedIndexedCollation currentCollation];
    
    [self configureSectionData];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
    self.tableData = nil;
    self.collation = nil;
    self.outerArray = nil;
    self.indexTitlesArray = nil;
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

//
//  BNDetailViewController.m
//  BabyNames
//
//  Created by Tim Duckett on 04/02/2012.
//  Copyright (c) 2012 Tim Duckett / Charismatic Megafauna Ltd
//  See license.txt for licensing information.
//

#import "BNDetailViewController.h"
#import "BNName.h"

@implementation BNDetailViewController

@synthesize BNName;
@synthesize nameTextLabel;
@synthesize genderLabel;
@synthesize derivationLabel;
@synthesize notesLabel;
@synthesize iconImageView;

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
    
    self.nameTextLabel.text = self.BNName.nameText;
    self.genderLabel.text = self.BNName.gender;
    self.derivationLabel.text = self.BNName.derivation;
    self.notesLabel.text = self.BNName.notes;
    
    self.iconImageView.image = [UIImage imageNamed:self.BNName.iconName];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.BNName = nil;
    self.nameTextLabel = nil;
    self.genderLabel = nil;
    self.derivationLabel = nil;
    self.notesLabel = nil;
    self.iconImageView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

//
//  BNDetailViewController.h
//  BabyNames
//
//  Created by Tim Duckett on 04/02/2012.
//  Copyright (c) 2012 Tim Duckett / Charismatic Megafauna Ltd
//  See license.txt for licensing information.
//

#import <UIKit/UIKit.h>

@class BNName;

@interface BNDetailViewController : UIViewController

@property (nonatomic, strong) BNName *BNName;
@property (nonatomic, strong) IBOutlet UILabel *nameTextLabel;
@property (nonatomic, strong) IBOutlet UILabel *genderLabel;
@property (nonatomic, strong) IBOutlet UILabel *derivationLabel;
@property (nonatomic, strong) IBOutlet UILabel *notesLabel;
@property (nonatomic, strong) IBOutlet UIImageView *iconImageView;

@end

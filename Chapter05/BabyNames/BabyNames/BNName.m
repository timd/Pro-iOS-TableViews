//
//  BNName.m
//  BabyNames
//
//  Created by Tim Duckett on 04/02/2012.
//  Copyright (c) 2012 Tim Duckett / Charismatic Megafauna Ltd
//  See license.txt for licensing information.
//

#import "BNName.h"

@implementation BNName

@synthesize nameText;
@synthesize gender;
@synthesize derivation;
@synthesize iconName;
@synthesize notes;

-(id)init {
    
    self = [super init];
    
    if (self) {
        // initialization code
    }
    
    return self;
}

@end

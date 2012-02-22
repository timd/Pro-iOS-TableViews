//
//  BNName.h
//  BabyNames
//
//  Created by Tim Duckett on 04/02/2012.
//  Copyright (c) 2012 Tim Duckett / Charismatic Megafauna Ltd
//  See license.txt for licensing information.
//

#import <Foundation/Foundation.h>

@interface BNName : NSObject

@property (nonatomic, strong) NSString *nameText;
@property (nonatomic, strong) NSString *gender;
@property (nonatomic, strong) NSString *derivation;
@property (nonatomic, strong) NSString *iconName;
@property (nonatomic, strong) NSString *notes;

@end

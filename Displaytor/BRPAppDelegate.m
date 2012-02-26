//
//  BRPAppDelegate.m
//  Displaytor
//
//  Created by Andrea D'Amore on 26/02/12.
//  Copyright (c) 2012 Brapinet. All rights reserved.
//

#import "BRPAppDelegate.h"

@implementation BRPAppDelegate

#pragma MARK Outlets
@synthesize window = _window;
@synthesize labelWidth;
@synthesize labelHeight;
@synthesize labelDiagonal;
@synthesize buttonUnit;
@synthesize fieldWidth;
@synthesize fieldHeight;
@synthesize fieldDiagonal;
@synthesize fieldRatioWidth;
@synthesize fieldRatioHeight;
@synthesize sizeFormatter;

#pragma MARK Methods
- (void) updateValues
{
    float   width, height, ratioWidth, ratioHeight, diagonal;
    
    diagonal    = [fieldDiagonal     floatValue];
    ratioWidth  = [fieldRatioWidth   floatValue];
    ratioHeight = [fieldRatioHeight  floatValue];
    
    width  = sqrt(pow(diagonal, 2) * pow(ratioWidth, 2) / (pow(ratioWidth, 2) + pow(ratioHeight, 2)));
    height = (width * ratioHeight / ratioWidth);

    [labelWidth    setFloatValue:width];
    [labelHeight   setFloatValue:height];
    [labelDiagonal setFloatValue:diagonal];
    [fieldWidth    setFloatValue:width];
    [fieldHeight   setFloatValue:height];
    
    if (![[buttonUnit title] isEqualToString:[sizeFormatter positiveSuffix]])
        [buttonUnit setTitle:[sizeFormatter positiveSuffix]];
}

- (void)awakeFromNib
{
    [self updateValues];
}

- (IBAction) dataChanged: (id)sender
{
    if (sender == fieldDiagonal || sender == fieldRatioWidth || sender == fieldRatioHeight)
        [self updateValues];
}

- (IBAction) switchUnit:(id)sender
{
    NSString *newSuffix;
    float factor;

    if ([[sizeFormatter positiveSuffix] isEqualToString:@" in"]) {
        newSuffix = [NSString stringWithString:@" cm"];
        factor=2.54;
    } else {
        newSuffix = [NSString stringWithString:@" in"];
        factor=1 / 2.54;
    }
    [sizeFormatter setPositiveSuffix:newSuffix];
    [fieldDiagonal setFloatValue:([fieldDiagonal floatValue] * factor)];
    [self updateValues];
}

@end

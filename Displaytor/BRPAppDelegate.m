//
//  BRPAppDelegate.m
//  Displaytor
//
//  Created by Andrea D'Amore on 26/02/12.
//  Copyright (c) 2012 Brapinet. All rights reserved.
//

#import "BRPAppDelegate.h"

@implementation BRPAppDelegate

@synthesize window = _window;
@synthesize sizeFormatter;
@synthesize display;

#pragma MARK UI ELEMENTS
@synthesize buttonUnit;

@synthesize fieldWidth;
@synthesize fieldHeight;

@synthesize labelWidth;
@synthesize labelHeight;
@synthesize labelDiagonal;

@synthesize labelDpi;
@synthesize labelDpiWidth;
@synthesize labelDpiHeight;


#pragma MARK METHODS
// updates values in UI controls, 
- (void) updateValues
{
    float   width, height, dpiWidth, dpiHeight, dpi,
        factor      = 1,
        diagonal    = [display diagonal],
        ratioWidth  = [display ratioWidth],
        ratioHeight = [display ratioHeight],
        pixelWidth  = [display pixelWidth],
        pixelHeight = [display pixelHeight];

    // calculates length sizes
    // we have a proportion between width:height and their ratio
    // and we can express height in function of width using Pythagoras' theorem since diagonal is known
    width     = sqrt(pow(diagonal, 2) * pow(ratioWidth, 2) / (pow(ratioWidth, 2) + pow(ratioHeight, 2)));
    height    = (width * ratioHeight / ratioWidth);

    // handle measure units by hand for now, this status info should be hold in the model instead
    if ([[sizeFormatter positiveSuffix] isEqualToString:@" cm"])
        factor = 2.54;    
    
    // horizontal and vertical resolution
    dpiWidth  = pixelWidth / (width / factor);
    dpiHeight = pixelHeight / (height / factor);    
    
    // good, old Pythagoras again
    dpi       = sqrt(pow(pixelHeight,2) + pow(pixelWidth,2)) / (diagonal/factor);


    [fieldWidth     setFloatValue:width];
    [fieldHeight    setFloatValue:height];
    
    [labelWidth     setFloatValue:width];
    [labelHeight    setFloatValue:height];
    [labelDiagonal  setFloatValue:diagonal];

    [labelDpi       setFloatValue:dpi];
    [labelDpiWidth  setFloatValue:dpiWidth];
    [labelDpiHeight setFloatValue:dpiHeight];
    
    if (![[buttonUnit title] isEqualToString:[sizeFormatter positiveSuffix]])
        [buttonUnit setTitle:[sizeFormatter positiveSuffix]];
}

- (void)awakeFromNib
{
    // goes through dataChanged rather than calling -updateValues, single entry point for UI updating
    [self dataChanged:nil];
}

// receive actions from text field controls, used to check the sender but there's no need in such a simple case
- (IBAction) dataChanged: (id)sender
{
    [self updateValues];
}


// switch measure unit by hand, only inches and centimeters taken into account
// the number formatter positiveSuffix holds the state
- (IBAction) switchUnit:(id)sender
{
    float factor;
    NSString *newSuffix;

    // set newSuffix and factor, then use those to alter UI
    if ([[sizeFormatter positiveSuffix] isEqualToString:@" in"]) {
        newSuffix = [NSString stringWithString:@" cm"];
        factor=2.54;
    } else {
        newSuffix = [NSString stringWithString:@" in"];
        factor=1 / 2.54;
    }
    [sizeFormatter setPositiveSuffix:newSuffix];
    [display setDiagonal:([display diagonal] * factor)];
    [self updateValues];
}

@end

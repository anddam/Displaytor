//
//  Display.m
//  Displaytor
//
//  Created by Andrea D'Amore on 04/03/12.
//  Copyright (c) 2012 Brapinet. All rights reserved.
//

#import "BRPDisplay.h"

@implementation BRPDisplay

@synthesize diagonal;
@synthesize ratioWidth;
@synthesize ratioHeight;
@synthesize pixelWidth;
@synthesize pixelHeight;

// buzz comment, there's very little to say
-(id) init
{
    self = [super init]; 
    
    if (self) {
        diagonal    = 10;
        ratioWidth  = 16;
        ratioHeight = 9;
        pixelWidth  = 800;
        pixelHeight = 480;
    }
    return self;
}

@end

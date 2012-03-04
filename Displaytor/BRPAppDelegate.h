//
//  BRPAppDelegate.h
//  Displaytor
//
//  Created by Andrea D'Amore on 26/02/12.
//  Copyright (c) 2012 Brapinet. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "BRPDisplay.h"

@interface BRPAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow          *window;
@property (retain) IBOutlet NSNumberFormatter *sizeFormatter;
@property (retain) IBOutlet BRPDisplay        *display;

#pragma MARK UI ELEMENTS
@property (retain) IBOutlet NSButton    *buttonUnit;

@property (retain) IBOutlet NSTextField *fieldWidth;
@property (retain) IBOutlet NSTextField *fieldHeight;

@property (retain) IBOutlet NSTextField *labelWidth;
@property (retain) IBOutlet NSTextField *labelHeight;
@property (retain) IBOutlet NSTextField *labelDiagonal;

@property (retain) IBOutlet NSTextField *labelDpi;
@property (retain) IBOutlet NSTextField *labelDpiWidth;
@property (retain) IBOutlet NSTextField *labelDpiHeight;


- (void)     updateValues;
- (IBAction) dataChanged: (id)sender;
- (IBAction) switchUnit: (id)sender;

@end

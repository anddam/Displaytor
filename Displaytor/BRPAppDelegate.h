//
//  BRPAppDelegate.h
//  Displaytor
//
//  Created by Andrea D'Amore on 26/02/12.
//  Copyright (c) 2012 Brapinet. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface BRPAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (retain) IBOutlet NSTextField *labelWidth;
@property (retain) IBOutlet NSTextField *labelHeight;
@property (retain) IBOutlet NSTextField *labelDiagonal;
@property (retain) IBOutlet NSButton    *buttonUnit;
@property (retain) IBOutlet NSTextField *fieldWidth;
@property (retain) IBOutlet NSTextField *fieldHeight;
@property (retain) IBOutlet NSTextField *fieldDiagonal;
@property (retain) IBOutlet NSTextField *fieldRatioWidth;
@property (retain) IBOutlet NSTextField *fieldRatioHeight;
@property (retain) IBOutlet NSNumberFormatter *sizeFormatter;

- (void)     updateValues;
- (IBAction) dataChanged: (id)sender;
- (IBAction) switchUnit: (id)sender;

@end

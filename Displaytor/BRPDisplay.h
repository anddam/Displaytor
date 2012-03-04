//
//  Display.h
//  Displaytor
//
//  Created by Andrea D'Amore on 04/03/12.
//  Copyright (c) 2012 Brapinet. All rights reserved.
//
//  Holds data for calculating display info

#import <Foundation/Foundation.h>

@interface BRPDisplay : NSObject

@property (assign) float diagonal;
@property (assign) float ratioWidth;
@property (assign) float ratioHeight;
@property (assign) int   pixelWidth;
@property (assign) int   pixelHeight;

@end

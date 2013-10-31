//
//  Door0.m
//  Button
//
//  Created by Dimitri Vishnepolsky on 10/30/13.
//  Copyright (c) dImo. All rights reserved.
//

#import "Door0.h"

@implementation Door0

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void) drawRect: (CGRect) rect
{
	// Drawing code
	//Print the name of the class.  See the main function in main.m.
	Class class = [self class];
    self.backgroundColor = [UIColor orangeColor];
	NSString *string = NSStringFromClass(class);
	CGPoint point = CGPointMake(0.0, 0.0);
	UIFont *font = [UIFont systemFontOfSize: 32];
	[string drawAtPoint: point withFont: font];
}

@end

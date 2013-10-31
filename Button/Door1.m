//
//  Door1.m
//  Button
//
//  Created by Dimitri Vishnepolsky on 10/30/13.
//  Copyright (c) dImo. All rights reserved.
//

#import "Door1.h"

@implementation Door1

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
    self.backgroundColor = [UIColor blueColor];
	NSString *string = NSStringFromClass([self class]);
	UIFont *font = [UIFont systemFontOfSize: 32];
	[string drawAtPoint: CGPointZero withFont: font];
}

@end

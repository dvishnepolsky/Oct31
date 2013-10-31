//
//  View.m
//  Button
//
//  Created by Dimitri Vishnepolsky on 10/30/13.
//  Copyright (c) 2013 dImo. All rights reserved.
//

#import "View.h"
#import "ButtonAppDelegate.h"	//so we can mention touchUpInside:

#import "Door0.h"
#import "Door1.h"

@implementation View

- (id) initWithFrame: (CGRect) frame
{
	self = [super initWithFrame: frame];
	if (self) {
		// Initialization code
		self.backgroundColor = [UIColor grayColor];
        
        //"door" added below
        
		views = [NSArray arrayWithObjects:
                 [[Door0 alloc] initWithFrame: self.bounds],
                 [[Door1 alloc] initWithFrame: self.bounds],
                 nil
                 ];
        
		index = 0;	//LittleView0 is the one that's initially visible.
		[self addSubview: [views objectAtIndex: index]];
        // end door
        
        
		button = [UIButton buttonWithType: UIButtonTypeRoundedRect];

		//Center the button in the view.
		CGRect b = self.bounds;
		CGSize s = CGSizeMake(100, 40);	//size of button

		button.frame = CGRectMake(
			b.origin.x + (b.size.width - s.width) / 2,
			b.origin.y + (b.size.height - s.height) / 2,
			s.width,
			s.height
		);

		button.backgroundColor = [UIColor yellowColor];
        
        
        
		[button setTitleColor: [UIColor redColor] forState: UIControlStateNormal];
		[button setTitle: @"Bullet!" forState: UIControlStateNormal];

		[button addTarget: [UIApplication sharedApplication].delegate
			action: @selector(touchUpInside:)
			forControlEvents: UIControlEventTouchUpInside
		];

		[self addSubview: button];
        
        
        
	}

	return self;
}


- (void) touchesEnded: (NSSet *) touches withEvent: (UIEvent *) event {
	
	/*
     Assume a swipe has just ended.  A more complicated program could
     distinguish between left vs. rights wipes, and perform a
     UIViewAnimationOptionTransitionFlipFromLeft or a
     UIViewAnimationOptionTransitionFlipFromRight.
     
     In UIViewAnimationOptionTransitionFlipFromLeft, the left edge moves
     to the right, and the right edge moves away from the user and to the
     left.
     */
    
	NSUInteger newIndex = 1 - index;	//toggle the index
    
	[UIView transitionFromView: [views objectAtIndex: index]
                        toView: [views objectAtIndex: newIndex]
                      duration: 2.25
                       options: UIViewAnimationOptionTransitionFlipFromLeft
                    completion: NULL
     ];
    
	index = newIndex;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void) drawRect: (CGRect) rect
{
	// Drawing code
}
*/

@end

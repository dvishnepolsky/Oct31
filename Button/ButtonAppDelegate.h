//
//  ButtonAppDelegate.h
//  Button
//
//  Created by Dimitri Vishnepolsky on 10/30/13.
//  Copyright (c) dImo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>	//needed for SystemSoundID
#import <AVFoundation/AVAudioPlayer.h>  //needed for AVAudioPlayer
@class View;

@interface ButtonAppDelegate: UIResponder <UIApplicationDelegate> {
	View *view;
	SystemSoundID sid;
    AVAudioPlayer *player;
}

- (void) touchUpInside: (id) sender;
@property (strong, nonatomic) UIWindow *window;
@end

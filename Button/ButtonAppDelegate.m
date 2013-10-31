//
//  ButtonAppDelegate.m
//  Button
//
//  Created by Dimitri Vishnepolsky on 10/30/13.
//  Copyright (c) dImo. All rights reserved.
//

#import "ButtonAppDelegate.h"
#import "View.h"

@implementation ButtonAppDelegate

- (BOOL) application: (UIApplication *) application didFinishLaunchingWithOptions: (NSDictionary *) launchOptions
{
	// Override point for customization after application launch.
	NSBundle *bundle = [NSBundle mainBundle];
	NSLog(@"bundle.bundlePath == \"%@\"", bundle.bundlePath);

    
    //register bullet sound, to be played on click
	NSString *filename = [bundle pathForResource: @"bullet" ofType: @"mp3"];
	NSLog(@"filename == \"%@\"", filename);

	NSURL *url = [NSURL fileURLWithPath: filename isDirectory: NO];
	NSLog(@"url == \"%@\"", url);

	OSStatus error = AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &sid);
	if (error != kAudioServicesNoError) {
		NSLog(@"AudioServicesCreateSystemSoundID error == %d", error);
	}

    
    //Play background music
    NSString *path =
    [bundle pathForResource: @"spy" ofType: @"mp3"];
    if (path == nil) {
        NSLog(@"could not get the path");
        return YES;
    }
    NSLog(@"path == \"%@\"", path);
    
    NSURL *url2 = [NSURL fileURLWithPath: path isDirectory: NO];
    NSLog(@"url2 == \"%@\"", url2);
    
    NSError *error2 = nil;
    player = [[AVAudioPlayer alloc]
              initWithContentsOfURL: url2 error: &error2];
    if (player == nil) {
        NSLog(@"error2 == %@", error2);
        return YES;
    }
    
    player.volume = 1.0;		//the default
    player.numberOfLoops = 0;	//negative number for infinite loop
    
    
    if (![player prepareToPlay]) {
        NSLog(@"could not prepare to play");
        return YES;
    }
    
    if (![player play]) {
        NSLog(@"could not play");
    }
    
    

	UIScreen *screen = [UIScreen mainScreen];
	view = [[View alloc] initWithFrame: screen.applicationFrame];
	self.window = [[UIWindow alloc] initWithFrame: screen.bounds];
	self.window.backgroundColor = [UIColor greenColor];

	[self.window addSubview: view];
	[self.window makeKeyAndVisible];
	return YES;
}

//Called by the buttoThe sender is the button that was pressed.
- (void) touchUpInside: (id) sender {

	NSLog(@"The \"%@\" button was pressed.",
		[sender titleForState: UIControlStateNormal]);

	//AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
	AudioServicesPlaySystemSound(sid);
}

- (void) applicationWillResignActive: (UIApplication *) application
{
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void) applicationDidEnterBackground: (UIApplication *) application
{
	// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
	// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void) applicationWillEnterForeground: (UIApplication *) application
{
	// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void) applicationDidBecomeActive: (UIApplication *) application
{
	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void) applicationWillTerminate: (UIApplication *) application
{
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.

	OSStatus error = AudioServicesDisposeSystemSoundID(sid);

	if (error != kAudioServicesNoError) {
		NSLog(@"AudioServicesDisposeSystemSoundID error == %d", error);
	}
}

@end

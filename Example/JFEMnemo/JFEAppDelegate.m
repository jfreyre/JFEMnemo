//
//  JFEAppDelegate.m
//  JFEMnemo
//
//  Created by CocoaPods on 05/13/2015.
//  Copyright (c) 2014 Jerome Freyre. All rights reserved.
//

#import "JFEAppDelegate.h"
#import "JFEMnemo.h"

@implementation JFEAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    
    NSLog(@"%d ==> %@", 125704, [[JFEMnemo sharedManager] fromInteger:125704]);
    NSLog(@"%@ ==> %ld", @"karasu", [[JFEMnemo sharedManager] toInteger:@"karasu"]);
    NSLog(@"%d ==> %@", -173866, [[JFEMnemo sharedManager] fromInteger:-173866]);
    
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

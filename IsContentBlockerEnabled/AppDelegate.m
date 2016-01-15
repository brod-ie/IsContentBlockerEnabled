//
//  AppDelegate.m
//  IsContentBlockerEnabled
//
//  Created by Ryan Brodie on 15/01/2016.
//  Copyright © 2016 Ryan Brodie. All rights reserved.
//

#import "AppDelegate.h"
#import "SafariServices/SafariServices.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [SFContentBlockerManager reloadContentBlockerWithIdentifier:@"ie.brod.IsContentBlockerEnabled.ContentBlocker" completionHandler: ^(NSError *error) {
        if (error != nil) {
            NSLog(@"%@", error);
        }
    }];
    
    return YES;
}

// URL Scheme Handling
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    if ([[url host] isEqualToString:@"isEnabled"]) {
        // Content Blocker is a go!
        NSLog(@"✅ IT'S ENABLED!");
    }
    else if ([[url host] isEqualToString:@"isDisabled"]) {
        // Nope, not enabled
        NSLog(@"❌ Oh.. it's not");
    }
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

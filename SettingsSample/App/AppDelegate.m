//
//  AppDelegate.m
//  SettingsSample
//
//  Created by Anton Sokolchenko on 26.01.17.
//  Copyright (c) 2017 Anton Sokolchenko. All rights reserved.
//

#import "AppDelegate.h"
#import "Settings.h"
#import "SampleCore.h"

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	
	[SampleCore setSettings:[[Settings alloc] init]];
    return YES;
}

- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings {
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
	
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
	
}

@end



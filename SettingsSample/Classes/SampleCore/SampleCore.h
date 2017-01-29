//
//  SampleCore.h
//  SettingsSample
//
//  Created by Anton Sokolchenko on 26.01.17.
//  Copyright © 2016 Anton Sokolchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Settings;

/**
 *  Class to store services
 */
@interface SampleCore : NSObject

+ (void)setSettings:(Settings *)settings;
+ (Settings *)settings;

@end

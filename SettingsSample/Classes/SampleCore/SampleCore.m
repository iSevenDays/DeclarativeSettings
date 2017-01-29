//
//  SampleCore.m
//  SettingsSample
//
//  Created by Anton Sokolchenko on 26.01.17.
//  Copyright © 2017 Anton Sokolchenko. All rights reserved.
//

#import "SampleCore.h"

@implementation SampleCore

static id _settings;

+ (void)setSettings:(Settings *)settings {
	_settings = settings;
}

+ (Settings *)settings {
	return _settings;
}


@end

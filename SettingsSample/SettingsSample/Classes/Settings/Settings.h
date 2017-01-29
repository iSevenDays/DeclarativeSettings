//
//  Settings.h
//  SettingsSample
//
//  Created by Anton Sokolchenko on 26.01.17.
//  Copyright (c) 2017 Anton Sokolchenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVCaptureDevice.h>



@interface Settings : NSObject

@property (nonatomic, assign) NSUInteger videoFormat;
@property (nonatomic, assign) NSUInteger mediaConfiguration;
@property (nonatomic, assign) NSUInteger audioCodec;
@property (nonatomic, assign) AVCaptureDevicePosition preferredCameraPosition;
@property (nonatomic, strong) NSArray *stunServers;

// RTC Config

@property (nonatomic) NSTimeInterval answerTimeInterval;
@property (nonatomic) NSTimeInterval disconnectTimeInterval;
@property (nonatomic) NSTimeInterval dialingTimeInterval;
@property (nonatomic) BOOL DTLSEnabled;

- (void)saveToDisk;

@end

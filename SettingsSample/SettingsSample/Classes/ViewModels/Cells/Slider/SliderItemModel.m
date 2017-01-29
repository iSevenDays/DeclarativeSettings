//
//  SliderItemModel.m
//  SettingsSample
//
//  Created by Anton Sokolchenko on 27.01.17.
//  Copyright 2017 Anton Sokolchenko. All rights reserved.
//

#import "SliderItemModel.h"
#import "SettingSliderCell.h"

@implementation SliderItemModel

@synthesize title = _title;

- (instancetype)initWithTitle:(NSString *)title minValue:(CGFloat)minValue maxValue:(CGFloat)maxValue currentValue:(CGFloat)currentValue changedBlock:(void (^ _Nullable)(CGFloat))changedBlock {
    self = [super initWithTitle:title data:nil selection:nil];
    if (self) {
        _minValue = minValue;
        _maxValue = maxValue;
        _currentValue = currentValue;
		_changedBlock = [changedBlock copy];
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title minValue:(CGFloat)minValue maxValue:(CGFloat)maxValue currentValue:(CGFloat)currentValue {
	return [self initWithTitle:title minValue:minValue maxValue:maxValue currentValue:currentValue changedBlock:nil];
}

- (instancetype)initWithMinValue:(CGFloat)minValue maxValue:(CGFloat)maxValue currentValue:(CGFloat)currentValue changedBlock:(void (^ _Nullable)(CGFloat))changedBlock {
    return [self initWithTitle:@"" minValue:minValue maxValue:maxValue currentValue:currentValue changedBlock:changedBlock];
}

- (instancetype)initWithMinValue:(CGFloat)minValue maxValue:(CGFloat)maxValue currentValue:(CGFloat)currentValue {
	return [self initWithMinValue:minValue maxValue:maxValue currentValue:currentValue changedBlock:nil];
}

- (Class)viewClass {
    return [SettingSliderCell class];
}

@end

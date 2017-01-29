//
//  SliderItemModel.h
//  SettingsSample
//
//  Created by Anton Sokolchenko on 27.01.17.
//  Copyright 2017 Anton Sokolchenko. All rights reserved.
//

#import <CoreGraphics/CGBase.h>
#import "TitleItemModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SliderItemModel : TitleItemModel

/// When set to YES, CGFloat will be rounded to integers, default is NO
@property (nonatomic, assign) BOOL useIntegers;

@property (nonatomic, assign) CGFloat maxValue;
@property (nonatomic, assign) CGFloat currentValue;
@property (nonatomic, assign) CGFloat minValue;

@property (copy, nonatomic, nullable) void (^changedBlock)(CGFloat currentValue);

- (instancetype)initWithTitle:(NSString *)title data:(nullable id)data selection:(nullable SelectionHandler)selection NS_UNAVAILABLE;

- (instancetype)initWithTitle:(NSString * )title minValue:(CGFloat)minValue maxValue:(CGFloat)maxValue currentValue:(CGFloat)currentValue changedBlock:(void(^_Nullable)(CGFloat currentValue))changedBlock NS_DESIGNATED_INITIALIZER;

- (instancetype)initWithMinValue:(CGFloat)minValue maxValue:(CGFloat)maxValue currentValue:(CGFloat)currentValue;

- (instancetype)initWithMinValue:(CGFloat)minValue maxValue:(CGFloat)maxValue currentValue:(CGFloat)currentValue changedBlock:(void(^_Nullable)(CGFloat currentValue))changedBlock;

- (Class)viewClass;

@end

NS_ASSUME_NONNULL_END

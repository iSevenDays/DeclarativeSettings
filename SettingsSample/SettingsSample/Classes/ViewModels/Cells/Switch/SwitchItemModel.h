//
//  SwitchItemModel.h
//  SettingsSample
//
//  Created by Anton Sokolchenko on 27.01.17.
//  Copyright 2017 Anton Sokolchenko. All rights reserved.
//

#import "TitleItemModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SwitchItemModel : TitleItemModel

@property (nonatomic, assign) BOOL on;
@property (copy, nonatomic, nullable) void (^changedBlock)(BOOL on);

- (instancetype)initWithTitle:(NSString *)title data:(nullable id)data selection:(nullable SelectionHandler)selection NS_UNAVAILABLE;

- (instancetype)initWithTitle:(NSString *)title data:(nullable id)data on:(BOOL)on;

- (instancetype)initWithTitle:(NSString *)title on:(BOOL)on changedBlock:(void(^_Nullable)(BOOL isOn))changedBlock;

- (instancetype)initWithTitle:(NSString *)title data:(nullable id)data on:(BOOL)on changedBlock:(void(^_Nullable)(BOOL isOn))changedBlock NS_DESIGNATED_INITIALIZER;

- (Class)viewClass;

@end

NS_ASSUME_NONNULL_END

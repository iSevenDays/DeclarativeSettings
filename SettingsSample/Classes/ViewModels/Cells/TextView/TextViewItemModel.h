//
//  TextViewItemModel.h
//  SettingsSample
//
//  Created by Anton Sokolchenko on 27.01.17.
//  Copyright © 2017 Anton Sokolchenko. All rights reserved.
//

#import "TitleItemModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface TextViewItemModel : TitleItemModel

/// Default: 1
@property (nonatomic, assign) NSUInteger numberOfLines;

/**
 *  Resign first responder (end editing) by tapping return key
 *  Default: YES
 */
@property (nonatomic, assign) BOOL resignEditingOnReturn;

@property (nonatomic, strong) NSString *placeholder;
@property (copy, nonatomic, nullable) void (^changedBlock)(NSString *_Nullable text);

- (instancetype)initWithTitle:(nullable NSString *)title data:(nullable id)data placeholder:(NSString *)placeholder changedBlock:(void(^_Nullable)(NSString *_Nullable text))changedBlock NS_DESIGNATED_INITIALIZER;

- (instancetype)initWithTitle:(nullable NSString *)title data:(nullable id)data selection:(nullable SelectionHandler)selection NS_UNAVAILABLE;
- (instancetype)initWithTitle:(nullable NSString *)title placeholder:(NSString *)placeholder;
- (instancetype)initWithTitle:(nullable NSString *)title placeholder:(NSString *)placeholder changedBlock:(void(^_Nullable)(NSString *_Nullable text))changedBlock;
- (instancetype)initWithTitle:(nullable NSString *)title data:(nullable id)data placeholder:(NSString *)placeholder;


- (Class)viewClass;

@end

NS_ASSUME_NONNULL_END

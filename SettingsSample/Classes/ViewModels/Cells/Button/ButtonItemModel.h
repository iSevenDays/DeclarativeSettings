//
//  ButtonItemModel.h
//  SettingsSample
//
//  Created by Anton Sokolchenko on 27.01.17.
//  Copyright © 2017 Anton Sokolchenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TitleItemModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ButtonItemModel : TitleItemModel

/// Default: Clear
@property (nonatomic, strong) UIColor *backgroundColor;

/// Default: Black
@property (nonatomic, strong) UIColor *textColor;

/**
 *  Offset from left
 *  Default: 10
 */
@property (nonatomic, assign) CGFloat leading;

/**
 *  Offset from right
 *  Default: 10
 */
@property (nonatomic, assign) CGFloat trailing;

/**
 *  Offset from top
 *  Default: 10
 */
@property (nonatomic, assign) CGFloat top;

/**
 *  Offset from bottom
 *  Default: 10
 */
@property (nonatomic, assign) CGFloat bottom;

@property (nonatomic, assign) CGFloat cornerRadius;

@property (copy, nonatomic, nullable) void (^clickedBlock)();

- (instancetype)initWithTitle:(NSString *)title data:(nullable id)data NS_UNAVAILABLE;

- (instancetype)initWithTitle:(NSString *)title clickedBlock:(void(^)())clickedBlock;
- (instancetype)initWithTitle:(NSString *)title data:(nullable id)data clickedBlock:(void(^)())clickedBlock;

- (Class)viewClass;

@end

NS_ASSUME_NONNULL_END

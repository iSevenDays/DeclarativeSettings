//
//  SettingsSectionModel.h
//  SettingsSample
//
//  Created by Anton Sokolchenko on 27.01.17.
//  Copyright 2017 Anton Sokolchenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseSettingsController.h"

NS_ASSUME_NONNULL_BEGIN

@interface SettingsSectionModel : NSObject

@property (nonatomic, copy, readonly, nullable) NSString *title;
@property (nonatomic, copy, readonly, nullable) NSString *identifier;
@property (nonatomic, strong) NSArray<id<BaseItemModel>> *items;

/// Init is not a supported initializer for this class
- (instancetype)init NS_UNAVAILABLE;

+ (instancetype)sectionWithTitle:(NSString *)title identifier:(nullable NSString *)identifier items:(NSArray<id<BaseItemModel>> *)items;

@end

NS_ASSUME_NONNULL_END

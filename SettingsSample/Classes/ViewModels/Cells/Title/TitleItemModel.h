//
//  TitleItemModel.h
//  SettingsSample
//
//  Created by Anton Sokolchenko on 27.01.17.
//  Copyright © 2017 Anton Sokolchenko. All rights reserved.
//

#import "BaseItemModel.h"
#import "SelectionModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface TitleItemModel : NSObject<BaseItemModel>

@property (nonatomic, copy, nonnull) NSString *title;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithTitle:(NSString *)title;
- (instancetype)initWithTitle:(NSString *)title selection:(nullable SelectionHandler)selection;

- (instancetype)initWithTitle:(NSString *)title data:(nullable id)data;
- (instancetype)initWithTitle:(NSString *)title data:(nullable id)data selection:(nullable SelectionHandler)selection NS_DESIGNATED_INITIALIZER;

- (Class)viewClass;

@end

NS_ASSUME_NONNULL_END

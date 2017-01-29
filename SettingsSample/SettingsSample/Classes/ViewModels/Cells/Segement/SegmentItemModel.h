//
//  SegmentItemModel.h
//  SettingsSample
//
//  Created by Anton Sokolchenko on 28.01.17.
//  Copyright © 2017 Anton Sokolchenko. All rights reserved.
//

#import "BaseItemModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SegmentItemModel : NSObject<BaseItemModel>

@property (nonatomic, assign) NSUInteger selectedIndex;
@property (nonatomic, strong, readonly) NSArray<NSString *> *segmentTitles;
@property (copy, nonatomic) void (^selectedIndexChangedBlock)(NSUInteger selectedIndex);

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithSegmentTitles:(NSArray<NSString *> *)segmentTitles;
- (instancetype)initWithSegmentTitles:(NSArray<NSString *> *)segmentTitles selectedIndexChangedBlock:(void(^_Nullable)(NSUInteger selectedIndex))selectedIndexChangedBlock NS_DESIGNATED_INITIALIZER;

- (Class)viewClass;

@end

NS_ASSUME_NONNULL_END

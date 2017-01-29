//
// Created by Anton Sokolchenko on 26.01.17.
// Copyright (c) 2017 Anton Sokolchenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SettingTitleCell.h"
#import "Settings.h"

@class BaseItemModel;
@class SettingsSectionModel;

NS_ASSUME_NONNULL_BEGIN

/**
 The BaseSettingsController class creates a controller object that manages a table view.
 
 You create a custom subclass of EKTableViewController for each table view that you want to manage. When you initialize the controller in initWithStyle:, you must specify the style of the table view (plain or grouped) that the controller is to manage. You may override loadView or any other superclass method, but if you do be sure to invoke the superclass implementation of the method, usually as the first method call.
 */
@interface BaseSettingsController : UITableViewController<UITableViewDataSource, UITableViewDelegate>

- (void)addSection:(SettingsSectionModel *)section;

/**
 *  Add new section
 *
 *  @param sectionTitle section title
 *  @param identifier   section identifier. If added section is already in list, old section will be replaced with new one
 *  @param items        items array of id<BaseItemModel>
 */
- (void)addSectionWithSectionTitle:(nullable NSString *)sectionTitle identifier:(nullable NSString *)identifier items:(NSArray<id<BaseItemModel>> *(^)())items;
- (void)addSectionWithSectionTitle:(nullable NSString *)sectionTitle items:(NSArray<id<BaseItemModel>> *(^)())items;

/**
 *  Add new section
 *
 *  @param sectionTitle section title
 *  @param identifier   section identifier. If added section is already in list, old section will be replaced with new one
 *  @param item         item id<BaseItemModel>
 */
- (void)addSectionWithSectionTitle:(nullable NSString *)sectionTitle identifier:(nullable NSString *)identifier item:(id<BaseItemModel>)item ;
- (void)addSectionWithSectionTitle:(nullable NSString *)sectionTitle item:(id<BaseItemModel>)item;

- (NSArray<SettingsSectionModel *> *)sections;

- (nullable SettingsSectionModel *)sectionWithTitle:(NSString *)sectionTitle;

@end

NS_ASSUME_NONNULL_END

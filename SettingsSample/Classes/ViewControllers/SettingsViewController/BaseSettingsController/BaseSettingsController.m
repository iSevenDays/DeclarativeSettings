//
// Created by Anton Sokolchenko on 26.01.17.
// Copyright (c) 2017 Anton Sokolchenko. All rights reserved.
//

#import "BaseSettingsController.h"
#import "SettingsSectionModel.h"
#import "Settings.h"
#import "SettingSliderCell.h"
#import "SettingSwitchCell.h"
#import "SelectionModel.h"

@interface BaseSettingsController()

@property (nonatomic, strong) NSMutableArray *mutableSections;
@property (nonatomic, assign) UITableViewStyle style;
@end

@implementation BaseSettingsController

#pragma mark - Initialisers

- (instancetype)init {
	self = [super initWithStyle:UITableViewStyleGrouped];
	if (self) {
		[self initialSetup];
	}
	return self;
}

- (instancetype)initWithStyle:(UITableViewStyle)style {
	self = [super initWithStyle:style];
	if (self) {
		[self initialSetup];
	}
	return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
	self = [super initWithCoder:aDecoder];
	if (self) {
		[self initialSetup];
	}
	return self;
}

- (void)initialSetup {
	self.mutableSections = [NSMutableArray array];
	
	self.extendedLayoutIncludesOpaqueBars = NO;
	
	[self.tableView registerNib:[UINib nibWithNibName:@"SettingTitleCell" bundle:nil] forCellReuseIdentifier:@"SettingTitleCell"];
	[self.tableView registerNib:[UINib nibWithNibName:@"SettingSliderCell" bundle:nil] forCellReuseIdentifier:@"SettingSliderCell"];
	[self.tableView registerNib:[UINib nibWithNibName:@"SettingSwitchCell" bundle:nil] forCellReuseIdentifier:@"SettingSwitchCell"];
	[self.tableView registerNib:[UINib nibWithNibName:@"SettingTextFieldCell" bundle:nil] forCellReuseIdentifier:@"SettingTextFieldCell"];
	[self.tableView registerNib:[UINib nibWithNibName:@"SettingButtonCell" bundle:nil] forCellReuseIdentifier:@"SettingButtonCell"];
	[self.tableView registerNib:[UINib nibWithNibName:@"SettingSegmentCell" bundle:nil] forCellReuseIdentifier:@"SettingSegmentCell"];
}

- (void)addSection:(SettingsSectionModel *)section {
	NSCAssert(self.sections != nil, @"Uninitialized sections");
	
	[self.mutableSections addObject:section];
}

- (void)addSectionWithSectionTitle:(NSString *)sectionTitle identifier:(NSString *)identifier items:(NSArray<id<BaseItemModel>> *(^)())items {
    NSCAssert(self.sections != nil, @"Uninitialized sections");
	
	SettingsSectionModel *section = [SettingsSectionModel sectionWithTitle:sectionTitle identifier:identifier items:(NSArray *) {
		 items()
	}];
	
	if (identifier != nil) {
		for (NSUInteger i = 0; i < self.mutableSections.count; i++) {
			SettingsSectionModel *existentSection = self.mutableSections[i];
			if (existentSection.identifier != nil && [existentSection.identifier isEqualToString:identifier]) {
				self.mutableSections[i] = section;
				return;
			}
		}
	}
	[self.mutableSections addObject:section];
}

- (void)addSectionWithSectionTitle:(NSString *)sectionTitle items:(NSArray<id<BaseItemModel>> * _Nonnull (^)())items {
	return [self addSectionWithSectionTitle:sectionTitle identifier:nil items:items];
}

- (void)addSectionWithSectionTitle:(NSString *)sectionTitle identifier:(NSString *)identifier item:(id<BaseItemModel>)item {
	[self addSectionWithSectionTitle:sectionTitle identifier:identifier items:^NSArray * {
        return @[item];
    }];
}

- (void)addSectionWithSectionTitle:(NSString *)sectionTitle item:(id<BaseItemModel>)item {
	return [self addSectionWithSectionTitle:sectionTitle identifier:nil item:item];
}

- (void)clearSelectionAnimated:(BOOL)animated {
	[self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:animated];
}

- (NSArray<SettingsSectionModel *> *)sections {
	return [self.mutableSections copy];
}

- (SettingsSectionModel *)sectionWithTitle:(NSString *)sectionTitle {
	for (SettingsSectionModel *settingsModel in self.mutableSections) {
		if ([settingsModel.title isEqualToString:sectionTitle]) {
			return settingsModel;
		}
	}
	return nil;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.mutableSections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    SettingsSectionModel *sectionItem = self.sections[section];
    return sectionItem.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    SettingsSectionModel *section = self.sections[indexPath.section];
    id<BaseItemModel> item = section.items[indexPath.row];

	NSCAssert([item conformsToProtocol:@protocol(BaseItemModel)], @"Item must be renderable");
	NSCAssert(item != nil, @"No item at indexPath");
	
    BaseSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(item.viewClass) forIndexPath:indexPath];

    cell.model = item;
	cell.accessoryType = item.rowAccessoryType;
	
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {

    SettingsSectionModel *sectionItem = self.sections[section];
    return sectionItem.title;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
	SettingsSectionModel *sectionModel = self.mutableSections[section];
	
	if ([tableView.dataSource tableView:tableView numberOfRowsInSection:section] == 0 ||
		sectionModel.title == nil ||
		[sectionModel.title isEqualToString:@""]) {
		
		return 0.01f; // return 0 does NOT work, known bug
	}
	return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
	if ([tableView.dataSource tableView:tableView numberOfRowsInSection:section] == 0) {
		
		return 0.01f; // return 0 does NOT work, known bug
	}
	return [super tableView:tableView heightForFooterInSection:section];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	SettingsSectionModel *section = self.sections[indexPath.section];
	id<BaseItemModel> item = section.items[indexPath.row];
	
	if ([item respondsToSelector:@selector(selectionHandler)] && [item selectionHandler] != nil) {
		SelectionModel *selection = [SelectionModel selectionWithIndexPath:indexPath object:item];
		item.selectionHandler(selection);
	} else {
		[self clearSelectionAnimated:YES];
	}
}

@end

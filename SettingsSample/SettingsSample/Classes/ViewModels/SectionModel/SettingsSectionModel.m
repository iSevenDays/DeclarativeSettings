//
//  SettingsSectionModel.m
//  SettingsSample
//
//  Created by Anton Sokolchenko on 27.01.17.
//  Copyright 2017 Anton Sokolchenko. All rights reserved.
//

#import "SettingsSectionModel.h"

@interface SettingsSectionModel()

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *identifier;

@end

@implementation SettingsSectionModel

+ (instancetype)sectionWithTitle:(NSString *)title identifier:(NSString *)identifier items:(NSArray *)items {
    
    SettingsSectionModel *section = [SettingsSectionModel new];
    section.title = title;
	section.identifier = identifier;
    section.items = items;
	
	for (id item in items) {
		NSCAssert([item conformsToProtocol:@protocol(BaseItemModel)], @"Error item must conform to renderable protocol");
	}
	
    return section;
}

@end

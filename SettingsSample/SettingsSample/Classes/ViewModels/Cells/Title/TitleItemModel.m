//
//  TitleItemModel.m
//  SettingsSample
//
//  Created by Anton Sokolchenko on 27.01.17.
//  Copyright © 2017 Anton Sokolchenko. All rights reserved.
//

#import "TitleItemModel.h"
#import "SettingTitleCell.h"

@implementation TitleItemModel

@synthesize data = _data;
@synthesize rowAccessoryType = _rowAccessoryType;
@synthesize selectionHandler = _selectionHandler;

- (instancetype)initWithTitle:(NSString *)title data:(id)data selection:(SelectionHandler)selection {
	self = [super init];
	if (self) {
		_title = [title copy];
		_data = data;
		_selectionHandler = [selection copy];
	}
	return self;
}

- (instancetype)initWithTitle:(NSString *)title {
	return [self initWithTitle:title data:nil selection:nil];
}

- (instancetype)initWithTitle:(NSString *)title data:(id)data {
	return [self initWithTitle:title data:data selection:nil];
}

- (instancetype)initWithTitle:(NSString *)title selection:(SelectionHandler)selection {
	return [self initWithTitle:title data:nil selection:selection];
}

- (Class)viewClass {
	
	return [SettingTitleCell class];
}


@end

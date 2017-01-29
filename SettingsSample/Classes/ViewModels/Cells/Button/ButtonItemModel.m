//
//  ButtonItemModel.m
//  SettingsSample
//
//  Created by Anton Sokolchenko on 27.01.17.
//  Copyright © 2017 Anton Sokolchenko. All rights reserved.
//

#import "ButtonItemModel.h"
#import "SettingButtonCell.h"

@implementation ButtonItemModel

- (instancetype)initWithTitle:(NSString *)title data:(id)data clickedBlock:(void (^)())clickedBlock {
	self = [super initWithTitle:title];
	if (self) {
		_backgroundColor = [UIColor clearColor];
		_textColor = [UIColor blackColor];
		_leading = 10;
		_trailing = 10;
		_top = 10;
		_bottom = 10;
		_cornerRadius = 0;
		_clickedBlock = [clickedBlock copy];
	}
	return self;
}

- (instancetype)initWithTitle:(NSString *)title clickedBlock:(void (^)())clickedBlock {
	return [self initWithTitle:title data:nil clickedBlock:clickedBlock];
}

- (Class)viewClass {
	return [SettingButtonCell class];
}

@end

//
//  TextViewItemModel.m
//  SettingsSample
//
//  Created by Anton Sokolchenko on 27.01.17.
//  Copyright © 2017 Anton Sokolchenko. All rights reserved.
//

#import "TextViewItemModel.h"
#import "SettingTextFieldCell.h"

@implementation TextViewItemModel

- (instancetype)initWithTitle:(NSString *)title data:(id)data placeholder:(NSString *)placeholder changedBlock:(void (^ _Nullable)(NSString * _Nonnull))changedBlock {
	self = [super initWithTitle:title data:data selection:nil];
	if (self) {
		_placeholder = [placeholder copy];
		_changedBlock = [changedBlock copy];
		_numberOfLines = 1;
		_resignEditingOnReturn = YES;
	}
	return self;
}

- (instancetype)initWithTitle:(NSString *)title placeholder:(NSString *)placeholder {
	return [self initWithTitle:title data:nil placeholder:placeholder];
}

- (instancetype)initWithTitle:(NSString *)title placeholder:(NSString *)placeholder changedBlock:(void (^)(NSString * _Nonnull))changedBlock {
	return [self initWithTitle:title data:nil placeholder:placeholder changedBlock:changedBlock];
}

- (instancetype)initWithTitle:(NSString *)title data:(id)data placeholder:(NSString *)placeholder {
	return [self initWithTitle:title data:data placeholder:placeholder changedBlock:nil];
}

- (Class)viewClass {
	return [SettingTextFieldCell class];
}

@end

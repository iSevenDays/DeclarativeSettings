//
//  SegmentItemModel.m
//  SettingsSample
//
//  Created by Anton Sokolchenko on 28.01.17.
//  Copyright © 2017 Anton Sokolchenko. All rights reserved.
//

#import "SegmentItemModel.h"
#import "SettingSegmentCell.h"

@implementation SegmentItemModel

@synthesize data = _data;
@synthesize rowAccessoryType = _rowAccessoryType;
@synthesize selectionHandler = _selectionHandler;

- (instancetype)initWithSegmentTitles:(NSArray<NSString *> *)segmentTitles selectedIndexChangedBlock:(void (^ _Nullable)(NSUInteger))selectedIndexChangedBlock {
	self = [super init];
	if (self) {
		_segmentTitles = [segmentTitles copy];
		_selectedIndexChangedBlock = [selectedIndexChangedBlock copy];
	}
	return self;
}

- (instancetype)initWithSegmentTitles:(NSArray<NSString *> *)segmentTitles {
	return [self initWithSegmentTitles:segmentTitles selectedIndexChangedBlock:nil];
}

- (Class)viewClass {
	return [SettingSegmentCell class];
}

@end

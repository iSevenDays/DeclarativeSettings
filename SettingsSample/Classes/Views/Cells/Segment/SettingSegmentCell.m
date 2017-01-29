//
//  SettingSegmentCell.m
//  SettingsSample
//
//  Created by Anton Sokolchenko on 28.01.17.
//  Copyright © 2017 Anton Sokolchenko. All rights reserved.
//

#import "SettingSegmentCell.h"
#import "SegmentItemModel.h"

@interface SettingSegmentCell()
@property (nonatomic, assign) NSUInteger selectedIndex;
@end

@implementation SettingSegmentCell

@synthesize model = _model;

- (void)setModel:(SegmentItemModel *)model {
	_model = model;
	
	[self.segmentControl removeAllSegments];
	
	for (NSString *segmentTitle in [model.segmentTitles reverseObjectEnumerator]) {
		[self.segmentControl insertSegmentWithTitle:segmentTitle atIndex:0 animated:NO];
	}
	[self.segmentControl setSelectedSegmentIndex:model.selectedIndex];
}

- (IBAction)segmentValueChanged:(UISegmentedControl *)sender {
	
	NSUInteger currentlySelectedIndex = sender.selectedSegmentIndex;
	
	if (currentlySelectedIndex == self.selectedIndex) {
		return;
	}
	
	self.selectedIndex = currentlySelectedIndex;
	
	SegmentItemModel *model = (id)self.model;
	
	if (model.selectedIndexChangedBlock != nil) {
		model.selectedIndexChangedBlock(currentlySelectedIndex);
	}
	
}

@end

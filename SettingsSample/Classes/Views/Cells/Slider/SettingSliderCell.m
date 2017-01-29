//
//  SettingSliderCell.m
//  SettingsSample
//
//  Created by Anton Sokolchenko on 27.01.17.
//  Copyright 2017 Anton Sokolchenko. All rights reserved.
//

#import "SettingSliderCell.h"
#import "SliderItemModel.h"

@implementation SettingSliderCell

@synthesize model = _model;

- (void)setModel:(SliderItemModel *)model {
    _model = model;
    
    self.label.text = [@(model.currentValue) stringValue];
    self.maxLabel.text = [@(model.maxValue) stringValue];
    self.minLabel.text = [@(model.minValue) stringValue];
    self.slider.minimumValue = model.minValue;
    self.slider.maximumValue = model.maxValue;
    self.slider.value = model.currentValue;
}

- (IBAction)valueChanged:(UISlider *)sender {
    
    SliderItemModel *model = (SliderItemModel *)self.model;
    model.currentValue = sender.value;
	if (model.useIntegers) {
		model.currentValue = (NSInteger)model.currentValue;
	}
    self.label.text = [@(model.currentValue) stringValue];
	
	if (model.changedBlock != nil) {
		model.changedBlock(model.currentValue);
	}
	
	if ([self.delegate conformsToProtocol:@protocol(SettingCellDelegate)]) {
		if ([self.delegate respondsToSelector:@selector(cell:didChangeModel:)]) {
			[self.delegate cell:self didChangeModel:self.model];
		}
	}
}

@end

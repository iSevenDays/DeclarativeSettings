//
//  SettingButtonCell.m
//  SettingsSample
//
//  Created by Anton Sokolchenko on 27.01.17.
//  Copyright © 2017 Anton Sokolchenko. All rights reserved.
//

#import "SettingButtonCell.h"
#import "ButtonItemModel.h"

@interface SettingButtonCell()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leading;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottom;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *trailing;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *top;

@end

@implementation SettingButtonCell

@synthesize model = _model;

- (void)setModel:(ButtonItemModel *)model {
	_model = model;
	
	[self.button setTitle:model.title forState:UIControlStateNormal];
	[self.button setTitleColor:model.textColor forState:UIControlStateNormal];
	self.button.backgroundColor = model.backgroundColor;
	
	if (model.cornerRadius > 0) {
		self.button.layer.cornerRadius = model.cornerRadius;
		self.button.layer.masksToBounds = YES;
	}
	
	self.leading.constant = model.leading;
	self.trailing.constant = model.trailing;
	self.top.constant = model.top;
	self.bottom.constant = model.bottom;
}

- (IBAction)buttonClicked:(id)sender {
	ButtonItemModel *model = (id)self.model;
	
	if (model.clickedBlock != nil) {
		model.clickedBlock();
	}
}

@end

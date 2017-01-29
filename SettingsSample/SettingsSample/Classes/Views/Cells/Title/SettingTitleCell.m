//
//  SettingCell.m
//  SettingsSample
//
//  Created by Anton Sokolchenko on 27.01.17.
//  Copyright 2017 Anton Sokolchenko. All rights reserved.
//

#import "SettingTitleCell.h"
#import "TitleItemModel.h"

@implementation SettingTitleCell

@synthesize model = _model;

- (void)setModel:(TitleItemModel *)model {
	
	_model = model;
	self.label.text = model.title;
}


@end

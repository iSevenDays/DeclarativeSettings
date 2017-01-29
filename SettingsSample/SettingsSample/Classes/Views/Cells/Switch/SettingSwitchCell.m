//
//  SettingSwitchCell.m
//  SettingsSample
//
//  Created by Anton Sokolchenko on 27.01.17.
//  Copyright 2017 Anton Sokolchenko. All rights reserved.
//

#import "SettingSwitchCell.h"
#import "SwitchItemModel.h"

@implementation SettingSwitchCell

- (void)setModel:(SwitchItemModel *)model {
    [super setModel:model];
	
    self.switchCtrl.on = model.on;
    self.accessoryType = UITableViewCellAccessoryNone;
}

- (IBAction)valueChanged:(UISwitch *)sender {
    
    SwitchItemModel *model = (id)self.model;
    model.on = sender.on;
	
    if (model.changedBlock != nil) {
        model.changedBlock(model.on);
    }
	
    if ([self.delegate conformsToProtocol:@protocol(SettingCellDelegate)]) {
        if ([self.delegate respondsToSelector:@selector(cell:didChangeModel:)]) {
            [self.delegate cell:self didChangeModel:self.model];
        }
    }
}

@end

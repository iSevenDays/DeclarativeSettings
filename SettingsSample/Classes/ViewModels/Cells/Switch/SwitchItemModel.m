//
//  SwitchItemModel.m
//  SettingsSample
//
//  Created by Anton Sokolchenko on 27.01.17.
//  Copyright 2017 Anton Sokolchenko. All rights reserved.
//

#import "SwitchItemModel.h"
#import "SettingSwitchCell.h"

@implementation SwitchItemModel

- (instancetype)initWithTitle:(NSString *)title data:(id)data on:(BOOL)on changedBlock:(void (^)(BOOL isOn))changedBlock {
    self = [super initWithTitle:title data:data selection:nil];
    if (self){
        _on = on;
        _changedBlock = [changedBlock copy];
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title data:(id)data on:(BOOL)on {
    return [self initWithTitle:title data:data on:on changedBlock:nil];
}

- (instancetype)initWithTitle:(NSString *)title on:(BOOL)on changedBlock:(void (^)(BOOL isOn))changedBlock {
    return [self initWithTitle:title data:nil on:on changedBlock:changedBlock];
}

- (Class)viewClass {
    return [SettingSwitchCell class];
}

@end

//
//  CallSettingsViewController.m
//  SettingsSample
//
//  Created by Anton Sokolchenko on 28.01.17.
//  Copyright 2017 Anton Sokolchenko. All rights reserved.
//

#import "CallSettingsViewController.h"
#import "SliderItemModel.h"
#import "SettingsSectionModel.h"
#import "SwitchItemModel.h"
#import "SampleCore.h"

@implementation CallSettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	__weak __typeof([SampleCore settings])weakSettings = [SampleCore settings];
	
    [self addSectionWithSectionTitle:@"Answer time interval" items:^NSArray *{
		SliderItemModel *slider = [[SliderItemModel alloc] initWithTitle:@"Answer time interval" minValue:10 maxValue:90 currentValue:weakSettings.answerTimeInterval changedBlock:^(CGFloat currentValue) {
			[SampleCore settings].answerTimeInterval = currentValue;
		}];
		
		return @[slider];
	}];
	
	[self addSectionWithSectionTitle:@"Disconnect time interval integers" items:^NSArray *{
		SliderItemModel *slider = [[SliderItemModel alloc] initWithTitle:@"Disconnect time interval" minValue:10 maxValue:90 currentValue:weakSettings.disconnectTimeInterval changedBlock:^(CGFloat currentValue) {
			[SampleCore settings].disconnectTimeInterval = currentValue;
		}];
		slider.useIntegers = YES;
		return @[slider];
	}];
	
	[self addSectionWithSectionTitle:@"Dialing time interval" items:^NSArray *{
		SliderItemModel *slider = [[SliderItemModel alloc] initWithTitle:@"Dialing time interval" minValue:3 maxValue:15 currentValue:weakSettings.dialingTimeInterval changedBlock:^(CGFloat currentValue) {
			[SampleCore settings].disconnectTimeInterval = currentValue;
		}];
		
		return @[slider];
	}];
	
	[self addSectionWithSectionTitle:@"DTLS" items:^NSArray *{
		SwitchItemModel *switchItem = [[SwitchItemModel alloc] initWithTitle:@"DTLS" data:nil on:weakSettings.DTLSEnabled changedBlock:^(BOOL isOn) {
			weakSettings.DTLSEnabled = isOn;
		}];
		
		return @[switchItem];
	}];
	
	[self.tableView reloadData];
}


@end

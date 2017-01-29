//
//  SettingsViewController.m
//  SettingsSample
//
//  Created by Anton Sokolchenko on 27.01.17.
//  Copyright (c) 2017 Anton Sokolchenko. All rights reserved.
//

#import "VideoSettingsViewController.h"
#import "Settings.h"
#import "SettingsSectionModel.h"
#import "BaseSettingsController.h"
#import "SampleCore.h"

#import "BaseSettingCell.h"
#import "SwitchItemModel.h"
#import "SliderItemModel.h"
#import "TextViewItemModel.h"
#import "ButtonItemModel.h"
#import "SegmentItemModel.h"

@implementation VideoSettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self configure];
    [self.tableView reloadData];
}


- (NSArray<TitleItemModel *> *)videoFormatModelsWithCameraPosition:(AVCaptureDevicePosition)cameraPosition {
    //Grab supported formats
	NSArray *formats = @[@1, @2];

    NSMutableArray *videoFormatModels = [NSMutableArray arrayWithCapacity:formats.count];
    for(NSNumber *videoFormat in formats) {

        TitleItemModel *videoFormatModel = [[TitleItemModel alloc] initWithTitle:[NSString stringWithFormat:@"%tux%tu", 1, 2]];
        videoFormatModel.data = videoFormat;
        [videoFormatModels addObject:videoFormatModel];
    }

    return videoFormatModels;
}

- (void)configure {

    //Camera position section
    __weak __typeof(self)weakSelf = self;

    [self addSectionWithSectionTitle:@"Camera Position" item:[[SwitchItemModel alloc] initWithTitle:@"Back Camera" data:nil on:([SampleCore settings].preferredCameraPosition == AVCaptureDevicePositionBack) changedBlock:^(BOOL isOn){
		__typeof(self)strongSelf = weakSelf;
        AVCaptureDevicePosition position = isOn ? AVCaptureDevicePositionBack : AVCaptureDevicePositionFront;
		
		[SampleCore settings].preferredCameraPosition = position;
		
		SettingsSectionModel *section = [strongSelf sectionWithTitle:@"Supported Formats"];
        section.items = [strongSelf videoFormatModelsWithCameraPosition:position];
		
		BOOL previousFormatExistsInNewCollection = NO;
		
		if (!previousFormatExistsInNewCollection) {
			[SampleCore settings].videoFormat = 1;
		}
		
        NSIndexSet *sectionToReload = [NSIndexSet indexSetWithIndex:1];
		
        [strongSelf.tableView reloadSections:sectionToReload withRowAnimation:UITableViewRowAnimationFade];
    }]];
    //Supported video formats section
    [self addSectionWithSectionTitle:@"Supported Formats" items:^NSArray *() {

        AVCaptureDevicePosition position = [SampleCore settings].preferredCameraPosition;
        NSArray *videoFormats = [weakSelf videoFormatModelsWithCameraPosition:position];

        return videoFormats;
    }];
    //Frame rate
    [self addSectionWithSectionTitle:@"Video Frame Rate" item:[[SliderItemModel alloc] initWithMinValue:2 maxValue:30 currentValue:[SampleCore settings].videoFormat changedBlock:^(CGFloat currentValue) {
		[SampleCore settings].videoFormat = currentValue;
	}]];

    //Video bandwidth
    [self addSectionWithSectionTitle:@"Band Width" item:[[SliderItemModel alloc] initWithMinValue:0 maxValue:2000 currentValue:[SampleCore settings].mediaConfiguration changedBlock:^(CGFloat currentValue) {
		[SampleCore settings].mediaConfiguration = currentValue;
	}]];
	
	//Input name
	[self addSectionWithSectionTitle:@"Input Your Name" item:[[TextViewItemModel alloc] initWithTitle:@"Title" placeholder:@"Placeholder"]];
	
	// Tap button
	ButtonItemModel *button = [[ButtonItemModel alloc] initWithTitle:@"Tap me" clickedBlock:^{
		NSLog(@"%@", @"Clicked!");
	}];
	button.backgroundColor = [UIColor grayColor];
	button.textColor = [UIColor blueColor];
	button.top = 2;
	button.bottom = 2;
	button.leading = 50;
	button.cornerRadius = 7;
	[self addSectionWithSectionTitle:@"Button test" item:button];
	
	// Segment
	SegmentItemModel *segment = [[SegmentItemModel alloc] initWithSegmentTitles:@[@"First", @"Second"] selectedIndexChangedBlock:^(NSUInteger selectedIndex) {
		NSLog(@"%@ %tu", @"Segment changed: ", selectedIndex);
	}];
	
	[self addSectionWithSectionTitle:nil item:segment];
}

#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
	BaseSettingCell *cell = (BaseSettingCell *)[super tableView:tableView cellForRowAtIndexPath:indexPath];
	id<BaseItemModel> item = cell.model;
	
	cell.accessoryType = item.rowAccessoryType;
	return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	
	[self.tableView reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section]
                  withRowAnimation:UITableViewRowAnimationAutomatic];
}
@end

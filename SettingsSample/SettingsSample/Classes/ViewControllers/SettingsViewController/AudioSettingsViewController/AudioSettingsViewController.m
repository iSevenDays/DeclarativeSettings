//
//  AudioSettingsViewController.m
//  SettingsSample
//
//  Created by Anton Sokolchenko on 27.01.17.
//  Copyright (c) 2017 Anton Sokolchenko. All rights reserved.
//

#import "AudioSettingsViewController.h"
#import "Settings.h"
#import "SettingsSectionModel.h"
#import "SampleCore.h"
#import "TitleItemModel.h"

@implementation AudioSettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	[self recreateSections];

    [self.tableView reloadData];
}

- (void)recreateSections {
	__weak __typeof(self)weakSelf = self;
	[self addSectionWithSectionTitle:@"Audio Codec" identifier:@"Audio" items:^NSArray * {
		
		TitleItemModel *opus = [[TitleItemModel alloc] initWithTitle:@"Opus" selection:^(SelectionModel *selection) {
			[SampleCore settings].audioCodec = 0;
			[weakSelf recreateSections];
			[weakSelf.tableView reloadSections:[[NSIndexSet alloc] initWithIndex:selection.indexPath.section] withRowAnimation:UITableViewRowAnimationNone];
		}];
		opus.rowAccessoryType = [SampleCore settings].audioCodec == 0 ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
		
		TitleItemModel *isac = [[TitleItemModel alloc] initWithTitle:@"ISAC" selection:^(SelectionModel *selection) {
			[SampleCore settings].audioCodec = 1;
			[weakSelf recreateSections];
			[weakSelf.tableView reloadSections:[[NSIndexSet alloc] initWithIndex:selection.indexPath.section] withRowAnimation:UITableViewRowAnimationNone];
		}];
		isac.rowAccessoryType = [SampleCore settings].audioCodec == 1 ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
		
		TitleItemModel *iLBC = [[TitleItemModel alloc] initWithTitle:@"iLBC" selection:^(SelectionModel *selection) {
			[SampleCore settings].audioCodec = 2;
			[weakSelf recreateSections];
			[weakSelf.tableView reloadSections:[[NSIndexSet alloc] initWithIndex:selection.indexPath.section] withRowAnimation:UITableViewRowAnimationNone];
		}];
		iLBC.rowAccessoryType = [SampleCore settings].audioCodec == 2 ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
		
		return @[opus, isac, iLBC];
	}];
}

@end

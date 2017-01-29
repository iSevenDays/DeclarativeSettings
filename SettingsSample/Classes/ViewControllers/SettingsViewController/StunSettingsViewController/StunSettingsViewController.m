//
//  StunViewController.m
//  SettingsSample
//
//  Created by Anton Sokolchenko on 27.01.17.
//  Copyright (c) 2017 Anton Sokolchenko. All rights reserved.
//

#import "StunSettingsViewController.h"
#import "Settings.h"
#import "SampleCore.h"
#import "TitleItemModel.h"

@interface StunSettingsViewController ()

@property (nonatomic, strong) NSDictionary *collection;
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) NSMutableArray *selectedServers;

@end

@implementation StunSettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadStunServers];
}

- (void)loadStunServers {
    
    self.selectedServers = [NSMutableArray array];
    
    [self.selectedServers addObjectsFromArray:[SampleCore settings].stunServers];
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"StunList" ofType:@"plist"];
	
    self.collection = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    self.titles = self.collection.allKeys;
	
	__weak __typeof(self)weakSelf = self;
	
	[self addSectionWithSectionTitle:@"Stun" items:^NSArray *{
        
		NSMutableArray *items = [NSMutableArray array];
		[weakSelf.collection enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
			TitleItemModel *baseItem = [[TitleItemModel alloc] initWithTitle:key];
			[items addObject:baseItem];
		}];
        
		return [items copy];
	}];
}

#pragma mark - Table view data source

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
	BaseSettingCell *cell = (BaseSettingCell *) [super tableView:tableView cellForRowAtIndexPath:indexPath];
	
    NSString *title = self.titles[indexPath.row];
    NSString *url = self.collection[title];
    
    cell.textLabel.text = title;
    cell.detailTextLabel.text = url;

    BOOL shouldSelectCell = [self.selectedServers containsObject:url];
    cell.accessoryType = shouldSelectCell ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
    [tableView deselectRowAtIndexPath:indexPath animated:NO];

    NSString *key = self.titles[indexPath.row];
    NSString *url = self.collection[key];
    
    if ([self.selectedServers containsObject:url]) {
        [self.selectedServers removeObject:url];
    }
    else {
        
        [self.selectedServers addObject:url];
    }
	
	[SampleCore settings].stunServers = self.selectedServers.copy;
	
    [self.tableView reloadData];
}

@end

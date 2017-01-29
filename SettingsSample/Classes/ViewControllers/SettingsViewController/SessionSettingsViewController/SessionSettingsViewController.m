//
//  SessionSettingsViewController.m
//  SettingsSample
//
//  Created by Anton Sokolchenko on 27.01.17.
//  Copyright (c) 2017 Anton Sokolchenko. All rights reserved.
//

#import "SessionSettingsViewController.h"
#import "Settings.h"
#import "AudioSettingsViewController.h"
#import "VideoSettingsViewController.h"
#import "StunSettingsViewController.h"
#import "CallSettingsViewController.h"
#import "SampleCore.h"

@interface SessionSettingsViewController()

@property(nonatomic, weak) Settings *settings;

@property(nonatomic, weak) IBOutlet UILabel *build;
@property(nonatomic, weak) IBOutlet UILabel *version;
@property(nonatomic, weak) IBOutlet UILabel *revision;

@end

typedef NS_ENUM(NSUInteger, SessionConfigureItem) {
	
    SessionConfigureItemVideo,
    SessionConfigureItemAudio,
    SessionConfigureItemStunServer,
	SessionConfigureItemCallSettings,
};

@implementation SessionSettingsViewController

- (void)loadView {
	[super loadView];
	_settings = [SampleCore settings];
}

- (void)viewDidLoad {
	[super viewDidLoad];
	
	NSString *build = [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleVersionKey];
	NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];

	self.build.text = [NSString stringWithFormat:@"Build %@", build];
	self.version.text = [NSString stringWithFormat:@"Version %@", version];
	self.revision.text = [NSString stringWithFormat:@" v%@ webrtc rev %@",@"1", @"2"];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.tableView reloadData];
}

#pragma mark - Actions

- (IBAction)pressDoneBtn:(id)sender {
    
    [[SampleCore settings] saveToDisk];
    [self applyConfiguration];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)applyConfiguration {

    [SampleCore settings].mediaConfiguration = 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
    cell.detailTextLabel.text = [self detailTextForRowAtIndexPath:indexPath];
    
    return cell;
}

- (NSString *)detailTextForRowAtIndexPath:(NSIndexPath *)indexPath {

    
    if (indexPath.row == SessionConfigureItemVideo) {
        
        return [NSString stringWithFormat:@"%tux%tu", self.settings.videoFormat, 11];
        
    }
    else if (indexPath.row == SessionConfigureItemAudio) {
        
        if (self.settings.mediaConfiguration == 1 ) {
            
            return @"Opus";
        }
        else if (self.settings.mediaConfiguration == 2) {
            
            return @"ISAC";
        }
        else if (self.settings.mediaConfiguration == 3) {
            
            return @"iLBC";
        }
    }
    else if (indexPath.row == SessionConfigureItemStunServer) {
        
        NSString *selected = [NSString stringWithFormat:@"Selected - %zd", [SampleCore settings].stunServers.count];
        return selected;
	}
    else if (indexPath.row == SessionConfigureItemCallSettings) {
        
		return @""; // nothing to show
	}
		
    return @"";
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
	BaseSettingsController *VC = nil;
	if (indexPath.row == SessionConfigureItemStunServer) {
        
		VC = [[StunSettingsViewController alloc] init];
	}
    else if (indexPath.row == SessionConfigureItemVideo) {
		VC = [[VideoSettingsViewController alloc] init];
	}
    else if (indexPath.row == SessionConfigureItemAudio) {
		VC = [[AudioSettingsViewController alloc] init];
	}
    else if( indexPath.row == SessionConfigureItemCallSettings) {
		VC = [[CallSettingsViewController alloc] init];
	}
    
	[self.navigationController pushViewController:VC animated:YES];
	
}

@end

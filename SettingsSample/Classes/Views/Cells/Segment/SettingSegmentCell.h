//
//  SettingSegmentCell.h
//  SettingsSample
//
//  Created by Anton Sokolchenko on 28.01.17.
//  Copyright © 2017 Anton Sokolchenko. All rights reserved.
//

#import "BaseSettingCell.h"

@interface SettingSegmentCell : BaseSettingCell

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControl;

@end

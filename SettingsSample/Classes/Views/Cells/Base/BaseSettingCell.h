//
//  BaseSettingCell.h
//  SettingsSample
//
//  Created by Anton Sokolchenko on 27.01.17.
//  Copyright 2017 Anton Sokolchenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseItemModel.h"

@protocol SettingCellDelegate;

@interface BaseSettingCell : UITableViewCell

@property (nonatomic, strong, nonnull) id<BaseItemModel> model;

@property (nonatomic, weak, nullable) id <SettingCellDelegate> delegate;

@end

@protocol SettingCellDelegate <NSObject>

- (void)cell:(BaseSettingCell *_Nonnull)cell didChangeModel:(nonnull id<BaseItemModel>)model;

@end

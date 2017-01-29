//
//  BaseItemModel.h
//  SettingsSample
//
//  Created by Anton Sokolchenko on 27.01.17.
//  Copyright 2017 Anton Sokolchenko. All rights reserved.
//

#import "SelectionModel.h"
#import <UIKit/UITableViewCell.h>

@protocol BaseItemModel <NSObject>

/**
 *  The block to be fired if a selection is made.
 *  In this case the row will not be deselected automatically
 */
@property (nonatomic, copy, nullable) SelectionHandler selectionHandler;

/// The accessory type to be displayed on the row's cell.
@property (nonatomic, assign) UITableViewCellAccessoryType rowAccessoryType;

/// Custom data you may need
@property (nonatomic, strong, nullable) id data;

/// View model class specified to render the item
- (nonnull Class)viewClass;

@end

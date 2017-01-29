//
//  SelectionModel.h
//  SettingsSample
//
//  Created by Anton Sokolchenko on 28.01.17.
//  Copyright © 2017 Anton Sokolchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SelectionModel;
@protocol BaseItemModel;

typedef void (^SelectionHandler)(SelectionModel *selection);

/**
 The EKTableRowSelection class represents a selection in an EKTableView.
 */
@interface SelectionModel : NSObject

/**
 The object or row that was selected in the table view.
 */
@property (nonatomic, strong) id<BaseItemModel> object;

/**
 The index path of the row that was selected in the table view.
 */
@property (nonatomic, strong) NSIndexPath *indexPath;

/**
 Creates a new instance with the supplied indexPath and object.
 @param indexPath The index path of the selection.
 @param object The object of the selection. Typically the row.
 */
+ (instancetype)selectionWithIndexPath:(NSIndexPath *)indexPath object:(id<BaseItemModel>)object;

@end

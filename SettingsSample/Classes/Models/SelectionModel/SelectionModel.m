//
//  SelectionModel.m
//  SettingsSample
//
//  Created by Anton Sokolchenko on 28.01.17.
//  Copyright © 2017 Anton Sokolchenko. All rights reserved.
//

#import "SelectionModel.h"

@implementation SelectionModel

+ (instancetype)selectionWithIndexPath:(NSIndexPath *)indexPath object:(id)object
{
	SelectionModel *selection = [SelectionModel new];
	selection.indexPath = indexPath;
	selection.object = object;
	
	return selection;
}

@end

//
//  SettingTextFieldCell.h
//  SettingsSample
//
//  Created by Anton Sokolchenko on 26.01.17.
//  Copyright © 2017 Anton Sokolchenko. All rights reserved.
//

#import "SettingTitleCell.h"
#import "MPTextView.h"

@interface SettingTextFieldCell : BaseSettingCell<UITextViewDelegate>

@property (nonatomic, weak) IBOutlet MPTextView *textView;

@end

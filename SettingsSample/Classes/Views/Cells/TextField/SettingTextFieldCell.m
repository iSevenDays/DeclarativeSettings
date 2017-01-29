//
//  SettingTextFieldCell.m
//  SettingsSample
//
//  Created by Anton Sokolchenko on 26.01.17.
//  Copyright © 2017 Anton Sokolchenko. All rights reserved.
//

#import "SettingTextFieldCell.h"
#import "TextViewItemModel.h"

@implementation SettingTextFieldCell

@synthesize model = _model;

- (void)setModel:(TextViewItemModel *)model {
	_model = model;
	
	self.textView.text = model.title;
	self.textView.placeholderText = model.placeholder;
}

- (NSUInteger)numberOfLines {
	
	NSDictionary *textAttributes = @{NSFontAttributeName : self.textView.font};
	CGFloat textWidth = CGRectGetWidth(UIEdgeInsetsInsetRect(self.textView.frame, self.textView.textContainerInset));
	textWidth -= 2.0f * self.textView.textContainer.lineFragmentPadding;
	
	CGRect boundingRect = [self.textView.text boundingRectWithSize:self.textView.frame.size options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:textAttributes context:nil];
	
	NSUInteger numberOfLines = CGRectGetHeight(boundingRect) / self.textView.font.lineHeight;
	
	return numberOfLines;
}

#pragma mark - UITextView

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
	TextViewItemModel *model = (id)self.model;
	
	if (model.resignEditingOnReturn && [text isEqualToString:@"\n"]) {
		[textView resignFirstResponder];
		return NO;
	}
	return YES;
}

- (void)textViewDidChange:(UITextView *)textView {
	TextViewItemModel *model = (id)self.model;
	
	if ([self numberOfLines] <= model.numberOfLines) {
		model.title = textView.text;
	} else {
		textView.text = model.title;
		return;
	}
	
	if (model.changedBlock != nil) {
		model.changedBlock(textView.text);
	}
	
	if ([self.delegate conformsToProtocol:@protocol(SettingCellDelegate)]) {
		if ([self.delegate respondsToSelector:@selector(cell:didChangeModel:)]) {
			[self.delegate cell:self didChangeModel:self.model];
		}
	}
}

@end

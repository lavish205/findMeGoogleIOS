//
//  UIExtensions.h
//  SecureCredentials
//
//  Created by Shreesh Garg on 01/10/13.
//  Copyright (c) 2013 SecureCredentials. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIButton  (Extensions)

-(void)setButtonImage:(NSString *)imageName;
-(void)setButtonBackgroudImage:(NSString *)imageName;
-(void)setButtonTitle:(NSString *)title;
-(void)setButtonTitleColor:(UIColor *)color;

@end



@interface UITextField  (Extensions)

- (void)setNumberKeybord;
- (BOOL)isBlank;
- (void)setPadding;
- (void)changeTextAllignment;

@end


@interface UITextView  (Extensions)

- (void)setNumberKeybord;

@end


@interface UIPickerView  (Extensions) 

-(void)setUpPickerViewWithDoneButton;
-(void)doneWithNumberPad;

@end


//@interface UIDatePicker  (Extensions)
//
//-(void)setUpPickerViewWithDoneButton;
//-(void)doneWithNumberPad;
//
//@end



@interface UILabel  (Extensions)

// These name conventions are based on Erika's HTML
-(void)setFont_tiny;
-(void)setFont_tiny_data;
-(void)setFont_small;
-(void)setFont_small_data;
-(void)setFont_medium;
-(void)setFont_medium_data;
-(void)setFont_textline_news;
-(void)setFont_textline_other;
-(void)setFont_label;
-(void)setFont_quotename;
-(void)setFont_quotename_date;
-(void)setFont_title;
-(void)setFont_last;
-(void)setFont_change;
-(void)setFont_change_down;
-(void)setFont_change_small;
-(void)setFont_change_down_small;
-(void)setFont_symbolprice;
-(void)setFont_news_divider;
-(void)setFont_column_headline;
-(void)setFont_coop;
-(void)setFont_time_dist;
-(void)setFont_headline_full;
-(void)setFont_table_border;
-(void)setFont_dropdown;
-(void)setRedColor;
-(void)setGreenColor;
-(void)setOrangeColor;
-(void)setHoldColor;
-(void)setGray42Color;
-(void)setDarkCaptionGreenColor;

-(void)setFont_medium_fullPage;
-(void)setFont_medium_data_fullPage;
-(void)setFont_page_title;




- (void)setFontSideMenuCell;
- (void)setFontLeftLabel;
- (void)changeTextAllignment;
- (void)setLabelHeightFit:(NSString *)string;
- (void)setLabelToWidthFit:(NSString *)string;


-(void)setZawgayiFont:(float)size;

@end



@interface UIColor (Extensions)

+ (UIColor *)colorWithHexString:(NSString *)string;

@end



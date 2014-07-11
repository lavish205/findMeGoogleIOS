//
//  UIExtensions.m
//  SecureCredentials
//
//  Created by Shreesh Garg on 01/10/13.
//  Copyright (c) 2013 SecureCredentials. All rights reserved.
//

#import "UIExtensions.h"


@implementation UIButton  (Extensions)


-(void)setButtonImage:(NSString *)imageName
{
    [self setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];

}
-(void)setButtonTitle:(NSString *)title
{
   [self setTitle:title forState:UIControlStateNormal];
}

-(void)setButtonTitleColor:(UIColor *)color
{
    [self setTitleColor:color forState:UIControlStateNormal];
}

-(void)setButtonBackgroudImage:(NSString *)imageName
{
  [self setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
}

@end




@implementation UITextField  (Extensions)

-(void)setNumberKeybord
{
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    numberToolbar.barStyle = UIBarStyleBlackTranslucent;
    numberToolbar.items = [NSArray arrayWithObjects:
                           [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelNumberPad)],
                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)],
                           nil];
    [numberToolbar sizeToFit];
    self.inputAccessoryView = numberToolbar;
}

-(void)cancelNumberPad{
    [self resignFirstResponder];
    self.text = @"";
}

-(void)doneWithNumberPad{
    
    [self resignFirstResponder];
}
- (BOOL)isBlank
{
    if (self.text.length==0) return YES;
    return NO;
    
}


- (void)setPadding
{
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 8, 20)];
    self.leftView = paddingView;
    self.leftViewMode = UITextFieldViewModeAlways;
    
    UIView *paddingViewRight = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 8, 20)];
    self.rightView = paddingViewRight;
    self.rightViewMode = UITextFieldViewModeAlways;

}

-(void)changeTextAllignment
{
   if(self.textAlignment == NSTextAlignmentLeft)
      [self setTextAlignment:NSTextAlignmentRight];
   else [self setTextAlignment:NSTextAlignmentLeft];
}

@end


@implementation UIPickerView (Extensions)

-(void)setUpPickerViewWithDoneButton
{
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    numberToolbar.barStyle = UIBarStyleBlackTranslucent;
    numberToolbar.items = [NSArray arrayWithObjects:
                          // [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelNumberPad)],
                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)],
                           nil];
    [numberToolbar sizeToFit];
    [self addSubview:numberToolbar];

}
-(void)doneWithNumberPad{
    
    [self.superview removeFromSuperview];
}
@end




//@implementation UIDatePicker (Extensions)
//
//-(void)setUpPickerViewWithDoneButton
//{
//    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 40)];
//    numberToolbar.barStyle = UIBarStyleBlackTranslucent;
//    numberToolbar.items = [NSArray arrayWithObjects:
//                           // [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelNumberPad)],
//                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
//                           [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)],
//                           nil];
//    [numberToolbar sizeToFit];
//    [self addSubview:numberToolbar];
//    [numberToolbar release];
//    
//}
//-(void)doneWithNumberPad{
//    
//    [self.superview removeFromSuperview];
//}
//@end




@implementation UILabel (Extensions)


-(void)setFont_tiny
{
     [self setTextColor:[UIColor colorWithRed:131.0/255.0f green:131.0/255.0f blue:131.0/255.0f alpha:1.0]];
     [self setFont:[UIFont fontWithName:@"Helvetica" size:11.0f]];

}
-(void)setFont_tiny_data
{
     [self setTextColor:[UIColor colorWithRed:66.0/255.0f green:66.0/66.0f blue:66.0/255.0f alpha:1.0]];
     [self setFont:[UIFont fontWithName:@"Helvetica-Bold" size:11.0f]];
    
}
-(void)setFont_small
{
    [self setTextColor:[UIColor colorWithRed:66.0/255.0f green:66.0/255.0f blue:66.0/255.0f alpha:1.0]];
    [self setFont:[UIFont fontWithName:@"Helvetica" size:12.0f]];
}
-(void)setFont_small_data
{
    [self setTextColor:[UIColor colorWithRed:66.0/255.0f green:66.0/255.0f blue:66.0/255.0f alpha:1.0]];
    [self setFont:[UIFont fontWithName:@"Helvetica-Bold" size:12.0f]];
}
-(void)setFont_medium
{
    [self setTextColor:[UIColor colorWithRed:131.0/255.0f green:131.0/255.0f blue:131.0/255.0f alpha:1.0]];
    [self setFont:[UIFont fontWithName:@"Helvetica" size:13.0f]];
}
-(void)setFont_medium_data
{
    [self setTextColor:[UIColor colorWithRed:131.0/255.0f green:131.0/255.0f blue:131.0/255.0f alpha:1.0]];
    [self setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13.0f]];
}

-(void)setFont_medium_fullPage
{
    [self setTextColor:[UIColor colorWithRed:66.0/255.0f green:66.0/255.0f blue:66.0/255.0f alpha:1.0]];
    [self setFont:[UIFont fontWithName:@"Helvetica" size:13.0f]];
}
-(void)setFont_medium_data_fullPage
{
    [self setTextColor:[UIColor colorWithRed:66.0/255.0f green:66.0/255.0f blue:66.0/255.0f alpha:1.0]];
    [self setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13.0f]];
}



-(void)setFont_textline_news
{
    [self setTextColor:[UIColor colorWithRed:131.0/255.0f green:131.0/255.0f blue:131.0/255.0f alpha:1.0]];
    [self setFont:[UIFont fontWithName:@"Helvetica" size:13.0f]];

}

-(void)setFont_textline_other
{
    [self setTextColor:[UIColor colorWithRed:131.0/255.0f green:131.0/255.0f blue:131.0/255.0f alpha:1.0]];
    [self setFont:[UIFont fontWithName:@"Helvetica" size:13.0f]];
    
}

-(void)setFont_label
{
    [self setTextColor:[UIColor colorWithRed:66.0/255.0f green:66.0/255.0f blue:66.0/255.0f alpha:1.0]];
    [self setFont:[UIFont fontWithName:@"Helvetica" size:16.0f]];

}

-(void)setFont_dropdown
{
    [self setTextColor:[UIColor colorWithRed:12.0/255.0f green:101.0/255.0f blue:72.0/255.0f alpha:1.0]];
    [self setFont:[UIFont fontWithName:@"Helvetica" size:13.0f]];
    
}

-(void)setFont_quotename
{
    [self setTextColor:[UIColor colorWithRed:66.0/255.0f green:66.0/255.0f blue:66.0/255.0f alpha:1.0]];
    [self setFont:[UIFont fontWithName:@"Helvetica-Bold" size:16.0f]];
}
-(void)setFont_quotename_date
{
    [self setTextColor:[UIColor colorWithRed:131.0/255.0f green:131.0/255.0f blue:131.0/255.0f alpha:1.0]];
    [self setFont:[UIFont fontWithName:@"Helvetica" size:14.0f]];

}
-(void)setFont_title
{
    [self setTextColor:[UIColor colorWithRed:249.0/255.0f green:111.0/255.0f blue:45.0/255.0f alpha:1.0]];
    [self setFont:[UIFont fontWithName:@"Helvetica" size:16.0f]];

}
-(void)setFont_last
{
    [self setTextColor:[UIColor colorWithRed:1.0/255.0f green:120.0/255.0f blue:233.0/255.0f alpha:1.0]];
    [self setFont:[UIFont fontWithName:@"Helvetica-Bold" size:16.0f]];
}

-(void)setFont_change
{
    [self setTextColor:[UIColor colorWithRed:19.0/255.0f green:179.0/255.0f blue:95.0/255.0f alpha:1.0]];
    [self setFont:[UIFont fontWithName:@"Helvetica-Bold" size:16.0f]];

}
-(void)setFont_change_down
{
    [self setTextColor:[UIColor colorWithRed:251.0/255.0f green:37.0/255.0f blue:26.0/255.0f alpha:1.0]];
    [self setFont:[UIFont fontWithName:@"Helvetica-Bold" size:16.0f]];

}
-(void)setFont_change_small
{
    [self setTextColor:[UIColor colorWithRed:19.0/255.0f green:179.0/255.0f blue:95.0/255.0f alpha:1.0]];
    [self setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13.0f]];

}
-(void)setFont_change_down_small
{
    [self setTextColor:[UIColor colorWithRed:251.0/255.0f green:37.0/255.0f blue:26.0/255.0f alpha:1.0]];
    [self setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13.0f]];
}
-(void)setFont_symbolprice
{
    [self setTextColor:[UIColor colorWithRed:1.0/255.0f green:120.0/255.0f blue:233.0/255.0f alpha:1.0]];
    [self setFont:[UIFont fontWithName:@"Helvetica-Bold" size:17.0f]];

}
-(void)setFont_news_divider
{
    [self setTextColor:[UIColor colorWithRed:249.0/255.0f green:111.0/255.0f blue:45.0/255.0f alpha:1.0]];
    [self setFont:[UIFont fontWithName:@"Helvetica" size:14.0f]];

}
-(void)setFont_column_headline
{
    [self setTextColor:[UIColor colorWithRed:66.0/255.0f green:66.0/255.0f blue:66.0/255.0f alpha:1.0]];
    [self setFont:[UIFont fontWithName:@"Helvetica-Bold" size:12.0f]];
}
-(void)setFont_coop
{
    [self setTextColor:[UIColor colorWithRed:12.0/255.0f green:101.0/255.0f blue:72.0/255.0f alpha:1.0]];
    [self setFont:[UIFont fontWithName:@"Helvetica-Bold" size:15.0f]];

}

-(void)setFont_table_border
{
    [self setTextColor:[UIColor colorWithRed:12.0/255.0f green:101.0/255.0f blue:72.0/255.0f alpha:1.0]];
    [self setFont:[UIFont fontWithName:@"Helvetica" size:13.0f]];

}

-(void)setFont_time_dist
{
    [self setTextColor:[UIColor colorWithRed:163.0/255.0f green:163.0/255.0f blue:163.0/255.0f alpha:1.0]];
    [self setFont:[UIFont fontWithName:@"Helvetica-Bold" size:12.0f]];
}
-(void)setFont_headline_full
{
    [self setTextColor:[UIColor colorWithRed:66.0/255.0f green:66.0/255.0f blue:66.0/255.0f alpha:1.0]];
    [self setFont:[UIFont fontWithName:@"Helvetica-Bold" size:14.0f]];

}

-(void)setFont_page_title
{
    [self setTextColor:[UIColor colorWithRed:249.0/255.0f green:111.0/255.0f blue:45.0/255.0f alpha:1.0]];
    [self setFont:[UIFont fontWithName:@"Helvetica" size:14.0f]];
}

-(void)setOrangeColor
{

    //249, 111, 45     
[self setTextColor:[UIColor colorWithRed:249.0/255.0f green:111.0/255.0f blue:45.0/255.0f alpha:1.0]];
}

-(void)setGray42Color
{
    
    [self setTextColor:[UIColor colorWithRed:66.0/255.0f green:66.0/255.0f blue:66.0/255.0f alpha:1.0]];
}

-(void)setHoldColor
{
    
    [self setTextColor:[UIColor colorWithRed:77.0/255.0f green:57.0/255.0f blue:172.0/255.0f alpha:1.0]];
}


-(void)setRedColor
{
   [self setTextColor:[UIColor colorWithRed:251.0/255.0f green:37.0/255.0f blue:26.0/255.0f alpha:1.0]];

}
-(void)setGreenColor
{
  [self setTextColor:[UIColor colorWithRed:19.0/255.0f green:179.0/255.0f blue:95.0/255.0f alpha:1.0]];
}

-(void)setDarkCaptionGreenColor
{
  [self setTextColor:[UIColor colorWithRed:12.0/255.0f green:101.0/255.0f blue:72.0/255.0f alpha:1.0]];
}




-(void)setFontSideMenuCell
{
    [self setTextColor:[UIColor colorWithRed:66.0/255.0f green:66.0/255.0f blue:66.0/255.0f alpha:1.0]];
    [self setFont:[UIFont fontWithName:@"Helvetica" size:15.0f]];

}


-(void)setFontLeftLabel
{
    [self setFont:[UIFont fontWithName:@"Helvetica" size:16.0f]];
    
}


-(void)changeTextAllignment
{
    if(self.textAlignment == NSTextAlignmentLeft)
        [self setTextAlignment:NSTextAlignmentRight];
    else [self setTextAlignment:NSTextAlignmentLeft];
}

- (void)setLabelHeightFit:(NSString *)string
{
    if([string isKindOfClass:[NSNull class]]) return;
    [self setNumberOfLines:NSIntegerMax];
    CGSize labelSize = [string sizeWithFont:self.font constrainedToSize:self.frame.size lineBreakMode:NSLineBreakByWordWrapping];
    [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width,labelSize.height + 2)];
}

- (void)setLabelToWidthFit:(NSString *)string
{
    if([string isKindOfClass:[NSNull class]]) return;
    CGSize labelSize = [string sizeWithFont:self.font constrainedToSize:self.frame.size lineBreakMode:NSLineBreakByWordWrapping];
    [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, labelSize.width ,self.frame.size.height)];
}

-(void)setZawgayiFont:(float)size
{
    [self setFont:[UIFont fontWithName:@"Zawgyi-One" size:size]];

}

@end


@implementation UITextView  (Extensions)

-(void)setNumberKeybord
{
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    numberToolbar.barStyle = UIBarStyleBlackTranslucent;
    numberToolbar.items = [NSArray arrayWithObjects:
                           [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelNumberPad)],
                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)],
                           nil];
    [numberToolbar sizeToFit];
    self.inputAccessoryView = numberToolbar;
    
}

-(void)cancelNumberPad{
    [self resignFirstResponder];
    self.text = @"";
}

-(void)doneWithNumberPad{
    
    [self resignFirstResponder];
}




@end




@implementation UIColor (Extensions)

+ (UIColor*)colorWithHexString:(NSString*)hex
{
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor grayColor];
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
        
        if ([cString length] != 6) return  [UIColor grayColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}


@end



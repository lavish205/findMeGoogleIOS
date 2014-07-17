//
//  ECSMainScreen.h
//  FindMeGoogle
//
//  Created by Developer on 03/07/14.
//  Copyright (c) 2014 Lavish Aggarwal. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ECSMainScreenCustomCell;
@interface ECSMainScreen : UIViewController
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activity;
@property (nonatomic,strong) IBOutlet ECSMainScreenCustomCell *cellView;
-(void)fetchData:(NSString*)string;

@end

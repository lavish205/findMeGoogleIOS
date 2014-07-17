//
//  ECSMainScreenCustomCell.m
//  FindMeGoogle
//
//  Created by Developer on 15/07/14.
//  Copyright (c) 2014 Lavish Aggarwal. All rights reserved.
//

#import "ECSMainScreenCustomCell.h"
#import "ECSMapView.h"
#import "ECSMainScreen.h"
#import "UIExtensions.h"
@interface ECSMainScreenCustomCell ()
<UITextFieldDelegate>
- (IBAction)clkto0:(id)sender;
- (IBAction)clkto1:(id)sender;
- (IBAction)clkto3:(id)sender;
- (IBAction)clkto2:(id)sender;
- (IBAction)clkto4:(id)sender;
- (IBAction)clkto5:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *btn0;
@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;
@property (weak, nonatomic) IBOutlet UIButton *btn3;
@property (weak, nonatomic) IBOutlet UIButton *btn4;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activity;
@property (weak, nonatomic) IBOutlet UIButton *btn5;
@property (nonatomic,retain) NSArray *array;
@property (nonatomic,retain) UIViewController * baseController;
@property (nonatomic,retain) ECSMainScreen *screen;

@end

@implementation ECSMainScreenCustomCell

-(void)bindDataWithArray:(NSArray *)array andController:(UIViewController *)controller
{
    
    self.array = array;
    self.baseController = controller;
    [self.btn0 setButtonTitle:[[NSString stringWithFormat:@"%@",[array objectAtIndex:0 ]]uppercaseString]];
    [self.btn1 setButtonTitle:[[NSString stringWithFormat:@"%@",[array objectAtIndex:1]] uppercaseString]];
    [self.btn2 setButtonTitle:[[NSString stringWithFormat:@"%@",[array objectAtIndex:2]] uppercaseString]];
    [self.btn3 setButtonTitle:[[NSString stringWithFormat:@"%@",[array objectAtIndex:3]] uppercaseString]];
    [self.btn4 setButtonTitle:[[NSString stringWithFormat:@"%@",[array objectAtIndex:4]] uppercaseString]];
    [self.btn5 setButtonTitle:[[NSString stringWithFormat:@"%@",[array objectAtIndex:5]] uppercaseString]];
    [self.screen.activity startAnimating];
}

- (IBAction)clkto0:(id)sender {
    NSLog(@"%@",[self.array objectAtIndex:0]);
    [self.activity startAnimating];
    self.screen = (ECSMainScreen *)self.baseController;

    [self.screen fetchData:[self.array objectAtIndex:0]];

}

- (IBAction)clkto1:(id)sender {
    NSLog(@"%@",[self.array objectAtIndex:1]);
    ECSMainScreen * screen = (ECSMainScreen *)self.baseController;
    [screen fetchData:[self.array objectAtIndex:1]];
}

- (IBAction)clkto3:(id)sender {
    NSLog(@"%@",[self.array objectAtIndex:2]);
    ECSMainScreen * screen = (ECSMainScreen *)self.baseController;
    [screen fetchData:[self.array objectAtIndex:2]];
}

- (IBAction)clkto2:(id)sender {
    NSLog(@"%@",[self.array objectAtIndex:3]);
    ECSMainScreen * screen = (ECSMainScreen *)self.baseController;
    [screen fetchData:[self.array objectAtIndex:3]];
}

- (IBAction)clkto4:(id)sender {
    NSLog(@"%@",[self.array objectAtIndex:4]);
    ECSMainScreen * screen = (ECSMainScreen *)self.baseController;
    [screen fetchData:[self.array objectAtIndex:4]];
}

- (IBAction)clkto5:(id)sender {
    NSLog(@"%@",[self.array objectAtIndex:5]);
    ECSMainScreen * screen = (ECSMainScreen *)self.baseController;
    [screen fetchData:[self.array objectAtIndex:5]];
}
@end

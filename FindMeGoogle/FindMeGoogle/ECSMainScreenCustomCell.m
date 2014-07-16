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
@property (weak, nonatomic) IBOutlet UIButton *btn5;
@property (nonatomic,retain) NSArray *array;

@end

@implementation ECSMainScreenCustomCell
-(void)bindDataWithArray:(NSArray *)array
{
    self.array = array;
    [self.btn0 setButtonTitle:[[NSString stringWithFormat:@"%@",[array objectAtIndex:0 ]]uppercaseString]];
    [self.btn1 setButtonTitle:[[NSString stringWithFormat:@"%@",[array objectAtIndex:1]] uppercaseString]];
    [self.btn2 setButtonTitle:[[NSString stringWithFormat:@"%@",[array objectAtIndex:2]] uppercaseString]];
    [self.btn3 setButtonTitle:[[NSString stringWithFormat:@"%@",[array objectAtIndex:3]] uppercaseString]];
    [self.btn4 setButtonTitle:[[NSString stringWithFormat:@"%@",[array objectAtIndex:4]] uppercaseString]];
    [self.btn5 setButtonTitle:[[NSString stringWithFormat:@"%@",[array objectAtIndex:5]] uppercaseString]];
}

- (IBAction)clkto0:(id)sender {
    NSLog(@"%@",[self.array objectAtIndex:0]);
    ECSMainScreen *screen = [[ECSMainScreen alloc]initWithNibName:@"ECSMainScreen" bundle:nil];
    [screen viewDidLoad];
    [screen fetchData:[self.array objectAtIndex:0]];
}

- (IBAction)clkto1:(id)sender {
    NSLog(@"%@",[self.array objectAtIndex:1]);
}

- (IBAction)clkto3:(id)sender {
    NSLog(@"%@",[self.array objectAtIndex:2]);
}

- (IBAction)clkto2:(id)sender {
    NSLog(@"%@",[self.array objectAtIndex:3]);
}

- (IBAction)clkto4:(id)sender {
    NSLog(@"%@",[self.array objectAtIndex:4]);
}

- (IBAction)clkto5:(id)sender {
    NSLog(@"%@",[self.array objectAtIndex:5]);
}
@end

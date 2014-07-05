//
//  ECSSettingPage.m
//  FindMeGoogle
//
//  Created by Developer on 05/07/14.
//  Copyright (c) 2014 Lavish Aggarwal. All rights reserved.
//

#import "ECSSettingPage.h"

@interface ECSSettingPage ()
<UIPickerViewDataSource,UIPickerViewDelegate>
@property (nonatomic,retain) NSMutableArray *rangePrefix;
@property (nonatomic,retain) NSArray *rangeSufix;
@end

@implementation ECSSettingPage

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.rangePrefix = [[NSMutableArray alloc]init];
    for(int i=500; i<=50000; i++)
    {
        if(i%500 == 0)
            [self.rangePrefix addObject:[NSString stringWithFormat:@"%i",i]];
    }
    self.rangeSufix = [[NSArray alloc]initWithObjects:@"Meter",@"Km", nil];
}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if(component == 0)
        return [self.rangePrefix count];
   
    else if(component == 1)
        return [self.rangeSufix count];
    else
        return 5;
}
- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    if (component == 0)
        return [self.rangePrefix objectAtIndex:row];
    else
        return [self.rangeSufix objectAtIndex:row];
    //ArraysOFArrays = Array1 & Array2
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    NSLog(@" row is %li and component is %li", (long)row,(long)component);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

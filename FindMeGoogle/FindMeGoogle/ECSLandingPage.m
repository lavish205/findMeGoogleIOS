//
//  ECSLandingPage.m
//  FindMeGoogle
//
//  Created by Developer on 03/07/14.
//  Copyright (c) 2014 Lavish Aggarwal. All rights reserved.
//

#import "ECSLandingPage.h"
#import "ECSMainScreen.h"

@interface ECSLandingPage ()

@property (nonatomic,retain) ECSMainScreen *mainScreen;
-(IBAction)clickToMainScreen:(id)sender;
@end

@implementation ECSLandingPage

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
     NSLog(@"hdhdhkd");
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)clickToMainScreen:(id)sender {
    NSLog(@"Main Screen Pushed");
    self.mainScreen = [[ECSMainScreen alloc]initWithNibName:@"ECSMainScreen" bundle:nil];
    [self.navigationController pushViewController:self.mainScreen animated:YES];
}
@end

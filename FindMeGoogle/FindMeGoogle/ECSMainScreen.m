//
//  ECSMainScreen.m
//  FindMeGoogle
//
//  Created by Developer on 03/07/14.
//  Copyright (c) 2014 Lavish Aggarwal. All rights reserved.
//

#import "ECSMainScreen.h"
#import "ECSMapView.h"
#import "ECSSettingPage.h"
@interface ECSMainScreen ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic,retain) ECSMapView *mapView;
@property (nonatomic,retain)ECSSettingPage *settingPage;
- (IBAction)clickToMapView:(id)sender;
- (IBAction)settingpage:(id)sender;
- (IBAction)detailView:(id)sender;

@end

@implementation ECSMainScreen

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickToMapView:(id)sender {
    self.mapView = [[ECSMapView alloc]initWithNibName:@"ECSMapView" bundle:nil];
    [self.navigationController pushViewController:self.mapView animated:YES];
}

- (IBAction)settingpage:(id)sender {
    self.settingPage = [[ECSSettingPage alloc]initWithNibName:@"ECSSettingPage" bundle:nil];
    [self.navigationController pushViewController:self.settingPage animated:NO];
}

- (IBAction)detailView:(id)sender {
}
@end

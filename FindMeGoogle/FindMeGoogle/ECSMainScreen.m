//
//  ECSMainScreen.m
//  FindMeGoogle
//
//  Created by Developer on 03/07/14.
//  Copyright (c) 2014 Lavish Aggarwal. All rights reserved.
//

#import "ECSMainScreen.h"
#import "ECSMapView.h"
@interface ECSMainScreen ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic,retain) ECSMapView *mapView;
- (IBAction)clickToMapView:(id)sender;

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
@end

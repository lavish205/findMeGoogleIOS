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
#import "ECSJSONPlaceSearch.h"
#import "ECSTableView.h"
#import <CoreLocation/CoreLocation.h>
#import "ECSConfig.h"
#import "ECSHelper.h"
@interface ECSMainScreen ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic,retain) ECSMapView *mapView;
@property (nonatomic,retain)ECSSettingPage *settingPage;
@property (nonatomic,retain)ECSTableView *tableView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activity;
@property (nonatomic,retain) CLLocationManager *locationManager;
@property (nonatomic,retain) ECSJSONPlaceSearch *searchObject;
@property (nonatomic,retain) NSString *radius;
- (IBAction)clickToMapView:(id)sender;
- (IBAction)settingpage:(id)sender;
- (IBAction)detailView:(id)sender;
@property CLLocationDegrees lat;
@property CLLocationDegrees Lng;
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
    [self.activity stopAnimating];
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.distanceFilter = kCLDistanceFilterNone; // whenever we move
    self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters; // 100 m
    [self.locationManager startUpdatingLocation];
    [self.navigationController setNavigationBarHidden:NO];
    
    
    self.radius = [ECSUserDefault getStringFromUserDefaultForKey:keyRadius];
    if(self.radius == NULL)
    {
        self.radius = @"5000";
    }
    self.lat = (double)[[ECSUserDefault getStringFromUserDefaultForKey:latt] floatValue];
    self.lng = (double)[[ECSUserDefault getStringFromUserDefaultForKey:lngg] floatValue];
    if(self.lat==0.000000)
    {
        self.lat = self.locationManager.location.coordinate.latitude;
        self.lng = self.locationManager.location.coordinate.longitude;
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)fetchData:(NSString*)string
{
    NSLog(@"user location : %f,%f",self.locationManager.location.coordinate.latitude,self.locationManager.location.coordinate.longitude);
    if(!(self.locationManager.location.coordinate.latitude == 0.00000 && self.locationManager.location.coordinate.longitude == 0.00000))
    {
        NSString *urlString = [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=%f,%f&radius=%@&types=%@&key=AIzaSyA0m675cHvtgbQr4EWWtTF9nNYLtJqpdh4",self.lat,self.Lng,self.radius,string];
    
        NSURL *requestURL = [NSURL URLWithString:urlString];
        NSURLRequest *request = [NSURLRequest requestWithURL:(requestURL)];
    
        //response
        NSData* response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        if(response == nil)
        {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"No Response" message:@"Please check your connectivity" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
        }
        else{
            NSDictionary * rootDictionary = [NSJSONSerialization JSONObjectWithData: response options: NSJSONReadingMutableContainers error: nil];
            self.searchObject = [ECSJSONPlaceSearch instanceFromDictionary:rootDictionary];
            
            [self performSelectorOnMainThread:@selector(switchToMapView) withObject:self waitUntilDone:NO];
        }
        
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please On your GPS and try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
}
-(void)switchToMapView
{
    self.mapView = [[ECSMapView alloc]initWithJsonSearch:self.searchObject];
    [self.activity stopAnimating];
    [self.navigationController pushViewController:self.mapView animated:YES];
}
- (IBAction)clickToMapView:(id)sender {
    [self performSelectorInBackground:@selector(fetchData:) withObject:@"food"];
    [self.activity startAnimating];
}

- (IBAction)settingpage:(id)sender {
    self.settingPage = [[ECSSettingPage alloc]initWithNibName:@"ECSSettingPage" bundle:nil];
    [self.navigationController pushViewController:self.settingPage animated:NO];
}

- (IBAction)detailView:(id)sender {
    self.tableView = [[ECSTableView alloc]initWithNibName:@"ECSTableView" bundle:nil];
    [self.navigationController pushViewController:self.tableView animated:YES];
}
-(void)viewWillDisappear:(BOOL)animated
{
    //[self.navigationController setNavigationBarHidden:YES];
}
@end

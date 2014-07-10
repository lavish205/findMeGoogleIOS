//
//  ECSMapView.m
//  FindMeGoogle
//
//  Created by Developer on 04/07/14.
//  Copyright (c) 2014 Lavish Aggarwal. All rights reserved.
//

#import "ECSMapView.h"
#import <GoogleMaps/GoogleMaps.h>
#import "ECSPlaceDetail.h"
#import "Result.h"
#import "ResultGeometry.h"
#import "ResultGeometryLocationn.h"
#import <CoreLocation/CoreLocation.h>
#import "ECSTableView.h"
@interface ECSMapView ()
<GMSMapViewDelegate>
{
    GMSMapView *mapView;}
@property (nonatomic,retain) NSString *lat;
@property (nonatomic,retain) NSString *lng;
@property (nonatomic,retain) NSMutableArray *placeId;
@property (nonatomic,retain) UIActivityIndicatorView *activity;
@property (nonatomic,retain) NSData *response;
@property (nonatomic,retain) CLLocationManager *locationManager;
@property (nonatomic, retain) ECSJSONPlaceSearch * searchObject;
@end

@implementation ECSMapView

-(id)initWithJsonSearch:(ECSJSONPlaceSearch *)search
{
    self = [self initWithNibName:@"ECSMapView" bundle:nil];
    self.searchObject = search;
    return self;
}

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
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.distanceFilter = kCLDistanceFilterNone; // whenever we move
    self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters; // 100 m
    [self.locationManager startUpdatingLocation];

    //adding button
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"Switch to Table View" forState:UIControlStateNormal];
    [button sizeToFit];
    [button addTarget:self action:@selector(switchToTable) forControlEvents:UIControlEventTouchUpInside];
    button.center = CGPointMake(100, 500);
    
    //setting camera for viewing the map
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:self.locationManager.location.coordinate.latitude	 longitude:self.locationManager.location.coordinate.longitude zoom:11];
    
    //adding camera to mapview
    mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    
    //enabling user location
    mapView.myLocationEnabled = YES;
    
    //defining map type
    mapView.mapType = kGMSTypeNormal;
    
    //enabling accessibility elements
    mapView.accessibilityElementsHidden =NO;
    
    //adding compass button on map
    mapView.settings.compassButton =YES;
    
    [mapView setDelegate:self];
    //adding map to application view
    self.view = mapView;
    [mapView addSubview:button];
    
    self.activity = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [self.activity setCenter:CGPointMake([UIScreen mainScreen].bounds.size.width/2,[UIScreen mainScreen].bounds.size.height/2)];
    [self.activity setColor:[UIColor blackColor]];
    [mapView addSubview:self.activity];

 
    if([self.searchObject.status isEqualToString:@"OK"])
    {
        [self showOnMap];
    }
    if([self.searchObject.status isEqualToString:@"ZERO_RESULTS"])
    {
        [self showAlertWithMessage:@"zero data found"];
    }
    if([self.searchObject.status isEqualToString:@"OVER_QUERY_LIMIT"])
    {
        [self showAlertWithMessage:@"request of the day is over quota"];
    }
    if([self.searchObject.status isEqualToString:@"REQUEST_DENIED"])
    {
        [self showAlertWithMessage:@"application map place search key is not valid"];
    }
    if([self.searchObject.status isEqualToString:@"INVALID_REQUEST"])
    {
        [self showAlertWithMessage:@"required parameter missing"];
    }
    
 
}
-(void)switchToTable
{
    ECSTableView *tView = [[ECSTableView alloc]initWithJsonSearch:self.searchObject];
 
    [self.navigationController pushViewController:tView animated:YES];
}
-(void)showAlertWithMessage:(NSString*)message
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:message delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    [alert show];
}


-(void)showOnMap
{
    for (Result * result in self.searchObject.results) {
        ResultGeometry *geo = result.geometry;
        ResultGeometryLocationn *loc = geo.location;
        
        CLLocationDegrees lat = (double)[loc.lat floatValue];
        CLLocationDegrees lng = (double)[loc.lng floatValue];
       
        NSData *iconData = [NSData dataWithContentsOfURL:[NSURL URLWithString:result.icon]];
        GMSMarker *marker1 = [[GMSMarker alloc]init];
        marker1.position = CLLocationCoordinate2DMake(lat,lng);
        marker1.title = result.name;
        marker1.snippet = result.vicinity;
        marker1.appearAnimation = kGMSMarkerAnimationPop;
        marker1.icon = [UIImage imageWithData:iconData scale:4];
        marker1.flat = YES;
        marker1.map = mapView;
     
    }
    [self.activity stopAnimating];
}
-(BOOL)mapView:(GMSMapView *)mapView didTapMarker:(GMSMarker *)marker
{

    NSLog(@"%@",marker.title);

    return NO;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

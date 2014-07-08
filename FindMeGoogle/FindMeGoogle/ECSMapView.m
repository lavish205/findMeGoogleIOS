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
@interface ECSMapView ()
<GMSMapViewDelegate>
{
    GMSMapView *mapView;
    GMSPanoramaView *panoView;
}
@property (nonatomic,retain) NSString *lat;
@property (nonatomic,retain) NSString *lng;
@property (nonatomic,retain) NSMutableArray *placeId;
@property (nonatomic,retain) UIActivityIndicatorView *activity;
@property (nonatomic,retain) NSData *response;
@end

@implementation ECSMapView

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
    

    
    //setting camera for viewing the map
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:28.617401	 longitude:77.381254 zoom:10];
    
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
    
   
    
    self.activity = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [self.activity setCenter:CGPointMake([UIScreen mainScreen].bounds.size.width/2,[UIScreen mainScreen].bounds.size.height/2)];
    [self.activity setColor:[UIColor blackColor]];
    [mapView addSubview:self.activity];
    
    //adding marker to map
    GMSMarker *marker = [[GMSMarker alloc]init];
    marker.position = CLLocationCoordinate2DMake(28.617401, 77.381254);
    marker.title = @"Here I am";
    marker.snippet = @"Your current location";
    marker.flat = YES;
    marker.appearAnimation = kGMSMarkerAnimationPop;
    marker.map = mapView;
 
    [self performSelectorInBackground:@selector(fetchResult) withObject:self];
    [self.activity startAnimating];
    
    
 
}



-(void)fetchResult{
    
    NSString *urlString = [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=28.617401,77.381254&radius=10000&types=gym&key=AIzaSyA0m675cHvtgbQr4EWWtTF9nNYLtJqpdh4"];
    
    NSURL *requestURL = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:(requestURL)];
    
    //response
    self.response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
 
    //    NSString * responsestring = [[NSString alloc]initWithData:response encoding:NSUTF8StringEncoding];
    //
    //
    //    NSLog(@"%@",responsestring);
    [self performSelectorOnMainThread:@selector(showOnMap) withObject:self waitUntilDone:NO];
}
-(void)showOnMap
{
    [self.activity stopAnimating];
    NSError *jsonParsingError = nil;
    NSDictionary *locationResults = [NSJSONSerialization JSONObjectWithData:self.response options:0 error:&jsonParsingError];
    NSArray *resposeArray = [[NSArray alloc]init];
    resposeArray = [locationResults objectForKey:@"results"];
    for (NSDictionary *dict in resposeArray) {
        self.lat = [[[dict objectForKey:@"geometry"] objectForKey:@"location"] valueForKey:@"lat"];
        
        self.lng = [[[dict objectForKey:@"geometry"] objectForKey:@"location"] valueForKey:@"lng"];
        
        CLLocationDegrees lat = (double)[self.lat floatValue];
        CLLocationDegrees lng = (double)[self.lng floatValue];
        
        NSData *iconData = [NSData dataWithContentsOfURL:[NSURL URLWithString:[dict valueForKey:@"icon"]]];
        
        NSString *title = [dict valueForKey:@"name"];
        NSString *desrciption = [dict valueForKey:@"vicinity"];
        
        
        GMSMarker *marker1 = [[GMSMarker alloc]init];
        marker1.position = CLLocationCoordinate2DMake(lat,lng);
        
        marker1.title = title;
        marker1.snippet = desrciption;
        marker1.appearAnimation = kGMSMarkerAnimationPop;
        marker1.icon = [UIImage imageWithData:iconData scale:4];
        marker1.flat = YES;
        marker1.map = mapView;
     
    }
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

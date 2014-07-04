//
//  ECSMapView.m
//  FindMeGoogle
//
//  Created by Developer on 04/07/14.
//  Copyright (c) 2014 Lavish Aggarwal. All rights reserved.
//

#import "ECSMapView.h"
#import <GoogleMaps/GoogleMaps.h>
@interface ECSMapView ()
{
    GMSMapView *mapView;
    GMSPanoramaView *panoView;
}
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
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:28.617401	 longitude:77.381254 zoom:6];
    
    //adding camera to mapview
    mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    
    //enabling user location
    mapView.myLocationEnabled = YES;
    
    //defining map type
    mapView.mapType = kGMSTypeHybrid;
    
    //enabling accessibility elements
    mapView.accessibilityElementsHidden =NO;
    
    //adding compass button on map
    mapView.settings.compassButton =YES;
    
    //addding myLocation Button on map
    mapView.settings.myLocationButton =YES;
    
    //adding map to application view
    self.view = mapView;
    
    
    //adding marker to map
    GMSMarker *marker = [[GMSMarker alloc]init];
    marker.position = CLLocationCoordinate2DMake(28.617401, 77.381254);
    marker.title = @"Here I am";
    marker.snippet = @"Your current location";
    NSLog(@"User Location %@",mapView.myLocation);
    marker.flat = YES;
    marker.appearAnimation = kGMSMarkerAnimationPop;
    marker.map = mapView;
   
    
    GMSMarker *marker2 = [[GMSMarker alloc]init];
    marker2.position = CLLocationCoordinate2DMake(28.817401, 77.881254);
    marker2.title = @"Here I am";
    marker2.snippet = @"Your current location";
    NSLog(@"User Location %@",mapView.myLocation);
    marker2.map = mapView;
    
    
    //adding a polyline between two markers
    GMSMutablePath *path = [GMSMutablePath path];
    [path addCoordinate:CLLocationCoordinate2DMake(28.617401, 77.381254)];
    [path addCoordinate:CLLocationCoordinate2DMake(28.817401, 77.881254)];
    GMSPolyline *polyline = [GMSPolyline polylineWithPath:path];
   
    polyline.map = mapView;        

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

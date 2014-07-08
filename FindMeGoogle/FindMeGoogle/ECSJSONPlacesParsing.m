//
//  ECSJSONPlacesParsing.m
//  FindMeGoogle
//
//  Created by Developer on 05/07/14.
//  Copyright (c) 2014 Lavish Aggarwal. All rights reserved.
//

#import "ECSJSONPlacesParsing.h"
#import <GoogleMaps/GoogleMaps.h>
#import "ECSTableView.h"
@interface ECSJSONPlacesParsing ()
@property (nonatomic,retain)NSMutableArray *array;

@end

@implementation ECSJSONPlacesParsing

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
    
    self.type = @"food";
    NSString *urlString = [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=28.617401,77.381254&radius=10000&types=%@&key=AIzaSyA0m675cHvtgbQr4EWWtTF9nNYLtJqpdh4",self.type];
    
    NSURL *requestURL = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:(requestURL)];
    
    //response
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    //    NSString * responsestring = [[NSString alloc]initWithData:response encoding:NSUTF8StringEncoding];
    //
    //
    //    NSLog(@"%@",responsestring);
    
    NSError *jsonParsingError = nil;
    NSDictionary *locationResults = [NSJSONSerialization JSONObjectWithData:response options:0 error:&jsonParsingError];
    NSArray *resposeArray = [[NSArray alloc]init];
    resposeArray = [locationResults objectForKey:@"results"];
    
    
    for (NSDictionary *dict in resposeArray) {
        
        self.lat = [[[dict objectForKey:@"geometry"] objectForKey:@"location"] valueForKey:@"lat"];
        
        self.lng = [[[dict objectForKey:@"geometry"] objectForKey:@"location"] valueForKey:@"lng"];
        
        CLLocationDegrees lat = (double)[self.lat floatValue];
        CLLocationDegrees lng = (double)[self.lng floatValue];
        
        self.iconData = [NSData dataWithContentsOfURL:[NSURL URLWithString:[dict valueForKey:@"icon"]]];
        
        self.title = [dict valueForKey:@"name"];
        self.description = [dict valueForKey:@"vicinity"];
        
        self.placeId = [dict valueForKey:@"place_id"];
    
        
     
        [self.array addObject:self];
    
    }
    

    
}


-(BOOL)mapView:(GMSMapView *)mapView didTapMarker:(GMSMarker *)marker
{
    
    return YES;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

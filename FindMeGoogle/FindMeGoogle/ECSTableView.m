//
//  ECSTableView.m
//  FindMeGoogle
//
//  Created by Developer on 05/07/14.
//  Copyright (c) 2014 Lavish Aggarwal. All rights reserved.
//

#import "ECSTableView.h"
#import "ECSPlaceDetail.h"
#import "Result.h"
#import "ResultGeometry.h"
#import "ResultGeometryLocationn.h"
#import "ECSPlaceDetail.h"
#import "ECSJSONPlaceSearch.h"
#import "UIImageView+WebCache.h"
#import "ECSPlaceDetail.h"

#import <CoreLocation/CoreLocation.h>
@interface ECSTableView ()
<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,retain) ECSPlaceDetail *placeDetail;
@property (nonatomic, retain) ECSJSONPlaceSearch * searchObject;
@property (nonatomic,retain)NSMutableArray * name;
@property (nonatomic,retain)NSMutableArray * desc;
@property (nonatomic,retain)NSMutableArray *icon;
@property (nonatomic,retain)NSMutableArray *place_id;
@property (nonatomic,retain)ResultGeometry *geo;
@property (nonatomic,retain) CLLocationManager *locationManager;
@property (nonatomic,retain)NSMutableArray *lat;
@property (nonatomic,retain)NSMutableArray *lng;
@end

@implementation ECSTableView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(id)initWithJsonSearch:(ECSJSONPlaceSearch *)search
{
    self = [self initWithNibName:@"ECSTableView" bundle:nil];
    self.searchObject = search;
    return self;
}

- (void)viewDidLoad
{
    
    self.name = [[NSMutableArray alloc]init];
    self.desc = [[NSMutableArray alloc]init];
    self.icon = [[NSMutableArray alloc]init];
    
    self.lat = [[NSMutableArray alloc]init];
    self.lng = [[NSMutableArray alloc]init];
    self.place_id = [[NSMutableArray alloc]init];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.distanceFilter = kCLDistanceFilterNone; // whenever we move
    self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters; // 100 m
    [self.locationManager startUpdatingLocation];
   for (Result * result in self.searchObject.results)
   {

       [self.name addObject:result.name];
       [self.desc addObject:result.vicinity];
       [self.icon addObject:result.icon];
       [self.place_id addObject:result.placeId];
       self.geo = [[ResultGeometry alloc]init];
       self.geo = result.geometry;
       ResultGeometryLocationn *loc = [[ResultGeometryLocationn alloc]init];
       loc = self.geo.location;
       [self.lat addObject:loc.lat];
       [self.lng addObject:loc.lng];
       
   }
   
    
}

//table view
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.name count];
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
  
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    
    cell.textLabel.text = [self.name objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [self.name objectAtIndex:indexPath.row];
    NSURL *url = [NSURL URLWithString:[self.icon objectAtIndex:indexPath.row]];
  
    [cell.imageView setImageWithURL:url];
//    NSLog(@"lat %@",[self.lat description]);
//    NSLog(@"lng %@",[self.lng description]);
//    CLLocationDegrees lat = [[self.lat objectAtIndex:indexPath.row]integerValue];
//    CLLocationDegrees lng = [[self.lng objectAtIndex:indexPath.row]integerValue];
//    CLLocationDegrees lat1 = self.locationManager.location.coordinate.latitude;
//    CLLocationDegrees lat2 = self.locationManager.location.coordinate.longitude;
//    
//    CLLocation *location1 = [[CLLocation alloc] initWithLatitude:lat longitude:lng];
//    CLLocation *location2 = [[CLLocation alloc]initWithLatitude:lat1 longitude:lat2];
//    location2 = [self.locationManager location];
//    
//    
//    float target = [location2 distanceFromLocation:location1]/1000;
//    
//    
//    UILabel *lbl = [[UILabel alloc]initWithFrame:CGRectMake(200, 30, 170, 15)];
//    lbl.text = [NSString stringWithFormat:@"%f KM",target];
//    
//    [cell.contentView addSubview:lbl];
  
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.placeDetail = [[ECSPlaceDetail alloc]initWithPlaceId:[self.place_id objectAtIndex:indexPath.row]];
    [self.navigationController pushViewController:self.placeDetail animated:YES];
   
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

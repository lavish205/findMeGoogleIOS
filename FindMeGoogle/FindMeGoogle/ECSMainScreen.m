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
#import "ECSMainScreenCustomCell.h"

@interface ECSMainScreen ()
<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,UISearchBarDelegate>
@property (nonatomic,retain) ECSMapView *mapView;
@property (nonatomic,retain)ECSSettingPage *settingPage;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,retain)NSArray *placeName;
@property (nonatomic,retain)NSArray *displayArray;
@property (nonatomic,retain) CLLocationManager *locationManager;
@property (nonatomic,retain) ECSJSONPlaceSearch *searchObject;
@property (nonatomic,retain) NSString *radius;

@property (nonatomic,retain) NSMutableArray *customArray;

- (IBAction)settingpage:(id)sender;

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
    [self.activity stopAnimating];
    self.lat = [[ECSUserDefault getStringFromUserDefaultForKey:latt] doubleValue];
    self.lng = [[ECSUserDefault getStringFromUserDefaultForKey:lngg] doubleValue];
    
    // Do any additional setup after loading the view from its nib.
   
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
    
    if(self.lat==0.000000)
    {
        self.lat = self.locationManager.location.coordinate.latitude;
        self.lng = self.locationManager.location.coordinate.longitude;
        NSLog(@"%f,%f",self.lat,self.Lng);
    }
    self.placeName = [[NSArray alloc]initWithObjects:@"accounting",@"airport",@"amusement_park",@"aquarium",@"art_gallery",@"atm",@"bakery",@"bank",@"bar",@"beauty_salon",@"bicycle_store",@"book_store",@"bowling_alley",@"bus_station",@"cafe",@"campground",@"car_dealer",@"car_rental",@"car_repair",@"car_wash",@"casino",@"cemetery",@"church",@"city_hall",@"clothing_store",@"convenience_store",@"courthouse",@"dentist",@"department_store",@"doctor",@"electrician",@"electronics_store",@"embassy",@"establishment",@"finance",@"fire_station",@"florist",@"food",@"funeral_home",@"furniture_store",@"gas_station",@"general_contractor",@"grocery_or_supermarket",@"gym",@"hair_care",@"hardware_store",@"health",@"hindu_temple",@"home_goods_store",@"hospital",@"insurance_agency",@"jewelry_store",@"laundry",@"lawyer",@"library",@"liquor_store",@"local_government_office",@"locksmith",@"lodging",@"meal_delivery",@"meal_takeaway",@"mosque",@"movie_rental",@"movie_theater",@"moving_company",@"museum",@"night_club",@"painter",@"park",@"parking",@"pet_store",@"pharmacy",@"physiotherapist",@"place_of_worship",@"plumber",@"police",@"post_office",@"real_estate_agency",@"restaurant",@"roofing_contractor",@"rv_park",@"school",@"shoe_store",@"shopping_mall",@"spa",@"stadium",@"storage",@"store",@"subway_station",@"synagogue",@"taxi_stand",@"train_station",@"travel_agency",@"university",@"veterinary_care",@"zoo", nil];
    self.customArray = [[NSMutableArray alloc]init];
    self.customArray = [self splittingArray:self.placeName];
    if(!(self.locationManager.location.coordinate.latitude == 0.00000 && self.locationManager.location.coordinate.longitude == 0.00000))
    {
    
    }
    else
    {
        [ECSAlert showAlert:@"GPS on krle bhai"];
    }

}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    //  [self.imgViewSearchIcon setHidden:YES];
    
    NSString *keyString=[textField.text stringByAppendingString:string];
    if([string isEqualToString:@""])
    {
        keyString=[textField.text substringToIndex:[textField.text length]-1];
        NSLog(@"%@",keyString);
        if([keyString isEqualToString:@""])
        {
            //[self.displayArray removeAllObjects];
            [self.tableView reloadData];
           
        }
        else{
            [self.tableView reloadData];
        }
    }
    
    else{
        self.displayArray=[self managingDisplayArrayFromArray:self.placeName withKey:keyString];
        NSLog(@"%@",[self.displayArray description]);
        self.customArray = [self splittingArray:self.displayArray];
        [self.tableView reloadData];
        
//        if(self.rng.length > range.length)
//        {
//            [self.displayArray removeLastObject];
//            [self.tblSearch reloadData];
//        }
//        
//        self.rng = range;
    }     return YES;
}
-(NSMutableArray *)managingDisplayArrayFromArray:(NSArray *)totalArray withKey:(NSString *)key
{
    NSMutableArray *ary=[[NSMutableArray alloc]init];
    key=[key lowercaseString];
    for (NSString *str in totalArray)
    {
        NSRange range = [str rangeOfString:key];
        if (range.location != NSNotFound )
            [ary addObject:str];
        
    }
    return ary;
}
-(NSMutableArray *)splittingArray:(NSArray *)array
{
    
    NSMutableArray * splittedArray = [[NSMutableArray alloc]init];
    for(int i = 0; i < array.count; i= i+6)
    {
        NSMutableArray * localArry = [[NSMutableArray alloc]init];
        for(int j = 0; j < MIN(6, array.count-i) ; j++)
        {
            [localArry addObject:[array objectAtIndex:i+j]];
        }
        [splittedArray addObject:localArry];
    }
    return splittedArray;
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)fetchData:(NSString*)string
{
    NSLog(@"%@",string);
    [self.activity startAnimating];
    self.lat = [[ECSUserDefault getStringFromUserDefaultForKey:latt] doubleValue];
    self.lng = [[ECSUserDefault getStringFromUserDefaultForKey:lngg] doubleValue];
    if(self.lat==0.000000)
    {
        self.lat = self.locationManager.location.coordinate.latitude;
        self.lng = self.locationManager.location.coordinate.longitude;
        NSLog(@"%f,%f",self.lat,self.Lng);
    }
    
    NSLog(@"user location : %f,%f",self.locationManager.location.coordinate.latitude,self.locationManager.location.coordinate.longitude);
    if(!(self.lat == 0.00000 && self.Lng == 0.00000))
    {

        NSString *urlString = [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=%f,%f&radius=%@&types=%@&key=AIzaSyA0m675cHvtgbQr4EWWtTF9nNYLtJqpdh4",self.lat,self.Lng,self.radius,string];
        NSLog(@"data will be shown of %f,%f",self.lat,self.Lng);
    
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
            
           // [self performSelectorOnMainThread:@selector(switchToMapView) withObject:self waitUntilDone:NO];
            [self performSelectorOnMainThread:@selector(switchToMapView) withObject:nil waitUntilDone:YES];
        }
        
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please On your GPS and try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
    
    
    [self.tableView reloadData];
    
}



//table view of custom cell
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.customArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[NSBundle mainBundle]loadNibNamed:@"ECSMainScreenCustomCell" owner:self options:nil];
    
    
    ECSMainScreenCustomCell * cell = self.cellView;
    
    [cell bindDataWithArray:[self.customArray objectAtIndex:indexPath.row] andController:self];
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;

}

-(void)switchToMapView
{
    self.mapView = [[ECSMapView alloc]initWithJsonSearch:self.searchObject];
    [self.activity stopAnimating];
    [self.navigationController pushViewController:self.mapView animated:YES];
}

- (IBAction)settingpage:(id)sender {
    self.settingPage = [[ECSSettingPage alloc]initWithNibName:@"ECSSettingPage" bundle:nil];
    [self.navigationController pushViewController:self.settingPage animated:NO];
}

-(void)viewWillDisappear:(BOOL)animated
{
    //[self.navigationController setNavigationBarHidden:YES];
}
@end

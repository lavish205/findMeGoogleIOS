//
//  ECSSettingPage.m
//  FindMeGoogle
//
//  Created by Developer on 05/07/14.
//  Copyright (c) 2014 Lavish Aggarwal. All rights reserved.
//

#import "ECSSettingPage.h"
#import "ECSMapView.h"
#import "ECSConfig.h"
#import "ECSHelper.h"
#import <CoreLocation/CoreLocation.h>
@interface ECSSettingPage ()
<UIPickerViewDataSource,UIPickerViewDelegate,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (nonatomic,retain) NSMutableArray *rangePrefix;
@property (nonatomic,retain) NSArray *rangeSufix;
@property (weak, nonatomic) IBOutlet UITableView *tblView;
@property (weak, nonatomic) IBOutlet UITextField *txtSearchPlace;
- (IBAction)finishEditing:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *settingUpperView;
@property (weak, nonatomic) IBOutlet UIView *settingLowerView;
@property (nonatomic,retain) NSMutableArray *resultArray;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activity;
@property (nonatomic,retain) NSString *lat;
@property (nonatomic,retain) NSString *lng;
@property (nonatomic,retain)CLLocationManager *locationManager;

- (IBAction)clickToType:(id)sender;
@end

@implementation ECSSettingPage

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
    [self.tblView setHidden:YES];
    self.resultArray = [[NSMutableArray alloc]init];
    // Do any additional setup after loading the view from its nib.
    self.rangePrefix = [[NSMutableArray alloc]init];
    for(int i=500; i<=50000; i++)
    {
        if(i%500 == 0)
            [self.rangePrefix addObject:[NSString stringWithFormat:@"%i",i]];
    }
    self.rangeSufix = [[NSArray alloc]initWithObjects:@"Meter",@"Km", nil];
    [self.activity stopAnimating];
    NSString *rangeVal = [ECSUserDefault getStringFromUserDefaultForKey:keyRadius];
    if(rangeVal == nil)
        rangeVal = @"5000";
    NSInteger pickerIndex = [self.rangePrefix indexOfObject:rangeVal];
    [self.pickerView selectRow:pickerIndex inComponent:0 animated:YES];
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.distanceFilter = kCLDistanceFilterNone; // whenever we move
    self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters; // 100 m
    [self.locationManager startUpdatingLocation];
    self.txtSearchPlace.text = [ECSUserDefault getStringFromUserDefaultForKey:settingText];
    
    
}

//method for fetching places with same starting text
-(void)generateRequestForText:(NSString *)text
{
    [self.activity startAnimating];
    [self.resultArray removeAllObjects];
    NSString *urlString = [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/autocomplete/json?input=%@&types=geocode&language=en&key=AIzaSyA0m675cHvtgbQr4EWWtTF9nNYLtJqpdh4",[text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"%@",urlString);
    NSURL *requestURL = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:(requestURL)];
    
   
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];

    
    NSError *jsonParsingError = nil;
    if(response==nil)
    {
        [ECSAlert showAlert:@"Please check your connectivity"];
    }
    else
    {
        NSLog(@"%@",urlString);
        NSDictionary *placesResult = [NSJSONSerialization JSONObjectWithData:response options:0 error:&jsonParsingError];
        NSArray *resposeArray = [[NSArray alloc]init];
        resposeArray = [placesResult objectForKey:@"predictions"];
        for (NSDictionary *dict in resposeArray) {
            
            [self.resultArray addObject:[dict valueForKey:@"description"]];
        }
        
        [self performSelectorOnMainThread:@selector(reloadTable) withObject:self waitUntilDone:YES];
    }
    
}
-(void)reloadTable
{
    [self.tblView reloadData];
    [self.activity stopAnimating];
}




//picker view methods
// returns the number of 'columns' to display in picker view,
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if(component == 0)
        return [self.rangePrefix count];
   
    else if(component == 1)
        return [self.rangeSufix count];
    else
        return 5;
}
- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    if (component == 0)
        return [self.rangePrefix objectAtIndex:row];
    
    else
        return [self.rangeSufix objectAtIndex:row];
    //ArraysOFArrays = Array1 & Array2
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    NSLog(@" row is %li and component is %li", (long)row,(long)component);
    if(component == 0)
    {
        NSString *value = [self.rangePrefix objectAtIndex:row] ;
        [ECSUserDefault saveString:value ToUserDefaultForKey:keyRadius];
    }
}


//table View
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.resultArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell==nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [self.resultArray objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.txtSearchPlace.text = [self.resultArray objectAtIndex:indexPath.row];
}

-(void)fetchGeoCodeofLocationWithString:(NSString*)string
{
    NSLog(@"%@",[string stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]);
    [self.activity startAnimating];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/geocode/json?address=%@&key=AIzaSyA0m675cHvtgbQr4EWWtTF9nNYLtJqpdh4",[string stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:(url)];
    
    
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    if(response == nil)
    {
        [ECSAlert showAlert:@"Please check your connectivity"];
    }
    else{
        NSLog(@"%@",response);
        NSError *jsonParsingError = nil;
        NSDictionary *placesResult = [NSJSONSerialization JSONObjectWithData:response options:0 error:&jsonParsingError];
        NSArray *resposeArray = [[NSArray alloc]init];
        NSString *status = [[NSString alloc]init];
        status = [placesResult objectForKey:@"status"];
        if([status isEqualToString:@"OK"])
        {
            resposeArray = [placesResult objectForKey:@"results"];
            NSLog(@"%@",[resposeArray description]);
            for (NSDictionary *dict in resposeArray) {
                
                //[self.resultArray addObject:[dict valueForKey:@"description"]];
                NSDictionary *geoDict = [[NSDictionary alloc]init];
                geoDict = [dict objectForKey:@"geometry"];
                NSLog(@"%@",[geoDict description]);
                NSDictionary *loc = [[NSDictionary alloc]init];
                loc = [geoDict valueForKey:@"location"];
                self.lat = [loc objectForKey:@"lat"];
                self.lng =[loc objectForKey:@"lng"];
                NSLog(@"manual latlong %@,%@",self.lat,self.lng);
                
            }
            
        }
        else if ([status isEqualToString:@"ZERO_RESULTS"])
        {
            [ECSAlert showAlert:@"No Result Found"];
            [self setLatLng];
        }
        else if ([status isEqualToString:@"OVER_QUERY_LIMIT"])
        {
            [ECSAlert showAlert:@"Request of the day is over quota"];
            [self setLatLng];
        }
        else if ([status isEqualToString:@"REQUEST_DENIED"])
        {
            [ECSAlert showAlert:@"api key is not valid"];
            [self setLatLng];
        }
        else if ([status isEqualToString:@"INVALID_REQUEST"])
        {
            [ECSAlert showAlert:@"Required paramenter are missing"];
            [self setLatLng];
        }
        else if ([status isEqualToString:@"UNKNOWN_ERROR"])
        {
            [ECSAlert showAlert:@"Unknown error"];
            [self setLatLng];
        }

        
        
    }
    [self.activity stopAnimating];
}

-(void)setLatLng
{
    self.lat = [NSString stringWithFormat:@"%f",self.locationManager.location.coordinate.latitude];
    self.lng = [NSString stringWithFormat:@"%f",self.locationManager.location.coordinate.longitude];
}

//textfield delegate method
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if(!self.txtSearchPlace.text.length == 0)
    {
        if(!((self.txtSearchPlace.text.length)-(range.length)) == 0)
        {
            NSString *text = self.txtSearchPlace.text;
            [self.tblView setHidden:NO];
            [self performSelectorInBackground:@selector(generateRequestForText:) withObject:text];
            
            
        }
        else
            [self.tblView setHidden:YES];
    }
        return YES;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)finishEditing:(id)sender {
    [sender resignFirstResponder];
    [UIView animateWithDuration:0.4 animations:^{
        self.settingLowerView.frame = CGRectMake(0, 292, 320, 276);
    }];
    [self.settingUpperView setHidden:NO];
    [self fetchGeoCodeofLocationWithString:self.txtSearchPlace.text];
}
- (IBAction)clickToType:(id)sender {
    [self.settingUpperView setHidden:YES];
    [UIView animateWithDuration:0.4 animations:^{
        self.settingLowerView.frame = CGRectMake(0, 70, 320, 276);
    }];
    
}
-(void)viewWillDisappear:(BOOL)animated
{
    [ECSUserDefault saveString:self.txtSearchPlace.text ToUserDefaultForKey:settingText];
    if(self.lat == NULL)
        [self fetchGeoCodeofLocationWithString:self.txtSearchPlace.text];
    [ECSUserDefault saveString:self.lat ToUserDefaultForKey:latt];
    [ECSUserDefault saveString:self.lng ToUserDefaultForKey:lngg];
    NSLog(@"saved latitude %@",self.lat);
}
@end

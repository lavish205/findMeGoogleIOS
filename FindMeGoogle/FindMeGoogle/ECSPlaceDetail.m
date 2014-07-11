//
//  ECSPlaceDetail.m
//  FindMeGoogle
//
//  Created by Developer on 08/07/14.
//  Copyright (c) 2014 Lavish Aggarwal. All rights reserved.
//

#import "ECSPlaceDetail.h"
#import "ECSJSONPlaceDetail.h"
#import "AddressComponent.h"
#import "Aspect.h"
#import "ECSJSONPlaceDetailResult.h"
#import "ECSJSONPlaceDetailResultGeometry.h"
#import "ECSJSONPlaceDetailResultGeometryLocation.h"
#import "Photo.h"
#import "Review.h"
#import "UIImageView+WebCache.h"
#import "ECSPlaceDetailCustomCell.h"
@interface ECSPlaceDetail ()
<UITableViewDataSource,UITableViewDelegate>
{
    int count;
}
@property (strong, nonatomic) IBOutlet UIView *headerView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIView *sectionView;
@property (weak, nonatomic) IBOutlet UIImageView *placeImage;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activity;
@property (weak, nonatomic) IBOutlet UIView *viewImage;

@property (weak, nonatomic) IBOutlet UILabel *txtratings;
@property (nonatomic,retain) NSData *imageData;
@property (nonatomic,retain) NSString *imageString;
@property (nonatomic, retain) NSString * place_id;
@property (nonatomic,retain) ECSJSONPlaceDetail *detailObject;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *mainActivity;
@property (weak, nonatomic) IBOutlet UILabel *placeName;
@property (weak, nonatomic) IBOutlet UILabel *phoneNo;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (nonatomic,retain) ECSJSONPlaceDetailResult *result;
@property (nonatomic,retain) Photo *photoArray;
@property (nonatomic,retain) NSMutableArray *picArray;
@property (weak, nonatomic) IBOutlet UILabel *lblNotFound;

@end

@implementation ECSPlaceDetail

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(id)initWithPlaceId:(NSString *)placeID
{
    self = [self initWithNibName:@"ECSPlaceDetail" bundle:nil];
    self.place_id = placeID;
    return self;
}


- (void)viewDidLoad
{
    count = 0;
    [self.lblNotFound setHidden:YES];
    self.picArray = [[NSMutableArray alloc]init];
    self.photoArray = [[Photo alloc]init];
    [self.activity stopAnimating];
    [self.mainActivity stopAnimating];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.tableView.tableHeaderView = self.headerView;
    [self performSelectorInBackground:@selector(fetchData) withObject:self];
    UISwipeGestureRecognizer *gestureRecognizerLeft = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeLeft:)];
    [gestureRecognizerLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    
    
    
    UISwipeGestureRecognizer *gestureRecognizerRight = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeRight:)];
    [gestureRecognizerRight setDirection:UISwipeGestureRecognizerDirectionRight];
    [self.viewImage addGestureRecognizer:gestureRecognizerRight];
    [self.viewImage addGestureRecognizer:gestureRecognizerLeft];
   
    
}
-(void)swipeLeft:(UITapGestureRecognizer *)recognizer
{
    
    if(count < ([self.picArray count]-1))
    {
        count++;
        [self.lblNotFound setHidden:YES];
        [UIView animateWithDuration:0.3 animations:^{
            [self.activity startAnimating];
            [self.placeImage setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=%@&key=AIzaSyA0m675cHvtgbQr4EWWtTF9nNYLtJqpdh4",[self.picArray  objectAtIndex:count]]]success:^(UIImage * image, BOOL cached)
             {[self.activity stopAnimating];} failure:^(NSError * err)
             {[self.activity stopAnimating];}];
           
        }];

    }
    else
    {
        NSLog(@"No other image");
        self.lblNotFound.text = @"Last image from left.";
        [self.lblNotFound setHidden:NO];
       
    }
    
    
}
-(void)swipeRight:(UITapGestureRecognizer *)recognizer
{
  
    if(count>0)
    {
        count--;
        [self.lblNotFound setHidden:YES];
        [UIView animateWithDuration:0.3 animations:^{
            [self.activity startAnimating];
            [self.placeImage setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=%@&key=AIzaSyA0m675cHvtgbQr4EWWtTF9nNYLtJqpdh4",[self.picArray  objectAtIndex:count]]]success:^(UIImage * image, BOOL cached)
             {[self.activity stopAnimating];} failure:^(NSError * err)
             {[self.activity stopAnimating];}];
           
        }];
        
    }
    else
    {
        self.lblNotFound.text = @"Last image from right.";
        [self.lblNotFound setHidden:NO];
        NSLog(@"No other image");
    }
    
}
-(void)showAlertWithMessage:(NSString*)message
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:message delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    [alert show];
}
-(void)fetchData
{
    NSLog(@"Started fetching the data");
    [self.mainActivity startAnimating];
    [self.activity startAnimating];
    NSString *urlString = [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/details/json?placeid=%@&key=AIzaSyA0m675cHvtgbQr4EWWtTF9nNYLtJqpdh4",self.place_id];
    NSLog(@"%@",urlString);
    NSURL *requestURL = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:(requestURL)];
    
    //response
    NSData* response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    if(response == nil)
    {
        [self showAlertWithMessage:@"Please check your connectivity"];
    }
    else
    {
        NSDictionary * rootDictionary = [NSJSONSerialization JSONObjectWithData: response options: NSJSONReadingMutableContainers error: nil];
        self.detailObject = [ECSJSONPlaceDetail instanceFromDictionary:rootDictionary];
        NSLog(@"Parsing over");
        if([self.detailObject.status isEqualToString:@"OK"])
        {
            self.result = self.detailObject.result;
            
            
            self.address.text = self.result.formattedAddress;
            self.phoneNo.text = self.result.formattedPhoneNumber;
            self.placeName.text = self.result.name;
            self.txtratings.text = [NSString stringWithFormat:@"%@",self.result.rating];
            [self performSelectorOnMainThread:@selector(fetchingImage) withObject:nil waitUntilDone:NO];
            
            [self.mainActivity stopAnimating];
            [self.tableView reloadData];
        }
        if([self.detailObject.status isEqualToString:@"ZERO_RESULTS"])
        {
            [self showAlertWithMessage:@"zero data found"];
        }
        if([self.detailObject.status isEqualToString:@"OVER_QUERY_LIMIT"])
        {
            [self showAlertWithMessage:@"request of the day is over quota"];
        }
        if([self.detailObject.status isEqualToString:@"REQUEST_DENIED"])
        {
            [self showAlertWithMessage:@"application map place search key is not valid"];
        }
        if([self.detailObject.status isEqualToString:@"INVALID_REQUEST"])
        {
            [self showAlertWithMessage:@"required parameter missing"];
        }
        if([self.detailObject.status isEqualToString:@"UNKNOWN_ERROR"])
        {
            [self showAlertWithMessage:@"server side error, please try re-launching your app"];
        }

    }
    
    
    
   
    
}
-(void)fetchingImage
{
    NSLog(@"in fetching image method");
    [self.activity startAnimating];
    NSLog(@"%@",self.result.photos);
    if(!(self.result.photos == NULL))
    {
        for(Photo * photo in self.result.photos)
        {
            self.photoArray = photo;
            
            [self.picArray addObject:self.photoArray.photoReference];
            
        }
        NSLog(@"fetching image over");
        [self.placeImage setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=%@&key=AIzaSyA0m675cHvtgbQr4EWWtTF9nNYLtJqpdh4",[self.picArray objectAtIndex:0]]] success:^(UIImage * image, BOOL cached)
         {[self.activity stopAnimating];} failure:^(NSError * err)
         {[self.activity stopAnimating];}];
       
        
        
    }
    else
    {
        [self.activity stopAnimating];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"No image found" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        
    }
}

//table view
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.result.reviews count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
 
       
    [[NSBundle mainBundle]loadNibNamed:@"ECSPlaceDetailCustomCell" owner:self options:nil];
   
    
    ECSPlaceDetailCustomCell * cell = self.listCell;
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    NSLog(@"%@",self.result.reviews);
 
    [cell bindDataWithReviews:[self.result.reviews objectAtIndex:indexPath.row] andController:self];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return self.sectionView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 99;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewDidDisappear:(BOOL)animated
{
    count = 0;
    self.picArray = nil;
    self.placeImage = nil;
    self.tableView = nil;
}
@end

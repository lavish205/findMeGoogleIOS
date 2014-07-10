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
@interface ECSPlaceDetail ()
<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *placeImage;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activity;
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
-(void)fetchData
{
    [self.mainActivity startAnimating];
    NSString *urlString = [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/details/json?placeid=%@&key=AIzaSyA0m675cHvtgbQr4EWWtTF9nNYLtJqpdh4",self.place_id];
    
    NSURL *requestURL = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:(requestURL)];
    
    //response
    NSData* response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSDictionary * rootDictionary = [NSJSONSerialization JSONObjectWithData: response options: NSJSONReadingMutableContainers error: nil];
    self.detailObject = [ECSJSONPlaceDetail instanceFromDictionary:rootDictionary];
    
    self.result = self.detailObject.result;
    
   
    self.address.text = self.result.formattedAddress;
    self.phoneNo.text = self.result.formattedPhoneNumber;
    self.placeName.text = self.result.name;
    [self performSelectorOnMainThread:@selector(fetchingImage) withObject:self waitUntilDone:YES];
    [self.mainActivity stopAnimating];
  
}
-(void)applyingFetchedResult
{

}
- (void)viewDidLoad
{
    self.picArray = [[NSMutableArray alloc]init];
    self.photoArray = [[Photo alloc]init];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 850);
    
    
    
   
    [self.activity startAnimating];
    
    [self performSelectorInBackground:@selector(fetchData) withObject:self];
   
    
}
-(void)fetchingImage
{
    [self.activity startAnimating];
   for(Photo * photo in self.result.photos)
   {
       self.photoArray = photo;
   
       [self.picArray addObject:self.photoArray.photoReference];
       
   }
   
    [self.placeImage setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=%@&key=AIzaSyA0m675cHvtgbQr4EWWtTF9nNYLtJqpdh4",[self.picArray objectAtIndex:0]]]];
    
    NSLog(@"%@",[NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=%@&key=AIzaSyA0m675cHvtgbQr4EWWtTF9nNYLtJqpdh4",[self.picArray objectAtIndex:0]]);
    [self.activity stopAnimating];
}




//table view
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = @"this is text";
    return cell;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

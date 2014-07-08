//
//  ECSPlaceDetail.m
//  FindMeGoogle
//
//  Created by Developer on 08/07/14.
//  Copyright (c) 2014 Lavish Aggarwal. All rights reserved.
//

#import "ECSPlaceDetail.h"

@interface ECSPlaceDetail ()
<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *placeImage;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activity;
@property (nonatomic,retain) NSData *imageData;
@property (nonatomic,retain) NSString *imageString;
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 850);
    
    //adding image to imageview
    NSString *imageRef = @"CoQBdAAAABgp-UvtkTwi8iOEdkIUonJkjGPvaKThJUDT-Q95Hi1xOtXjXtHmqxH-1nA_gCdzD2iMjNfClVE2lP5AsMWnk7WZRSeroaLP6AhKA7ITOimkntZoiqqieouva0RXK-dLta6fqny5XgC27zxAFvotowbvhUNVAcORPwdtSCKLrMZbEhDji489l0yXYAilRSaBBzVMGhQDH59YR0QiZmcT8zKfeLlcL_nWdA";
    self.imageString = [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/photo?maxwidth=300&maxheight=250&photoreference=%@&key=AIzaSyA0m675cHvtgbQr4EWWtTF9nNYLtJqpdh4",imageRef];
    
    [self performSelectorInBackground:@selector(fetchingImage) withObject:self];
    [self.activity startAnimating];
    
}
-(void)fetchingImage
{
    self.imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.imageString]];
    [self performSelectorOnMainThread:@selector(applyingImage) withObject:self waitUntilDone:NO];
}
-(void)applyingImage
{
    self.placeImage.image = [[UIImage alloc]initWithData:self.imageData];
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

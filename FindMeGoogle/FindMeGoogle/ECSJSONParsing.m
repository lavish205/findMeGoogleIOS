//
//  ECSJSONParsing.m
//  FindMeGoogle
//
//  Created by Developer on 08/07/14.
//  Copyright (c) 2014 Lavish Aggarwal. All rights reserved.
//

#import "ECSJSONParsing.h"
#import "ECSTableView.h"

@interface ECSJSONParsing ()

@end

@implementation ECSJSONParsing

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
	// Do any additional setup after loading the view.
    
    NSString *urlString = [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=28.617401,77.381254&radius=10000&types=police&key=AIzaSyA0m675cHvtgbQr4EWWtTF9nNYLtJqpdh4"];
    
    NSURL *requestURL = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:(requestURL)];
    
    //response
    NSData* response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
        NSString * responsestring = [[NSString alloc]initWithData:response encoding:NSUTF8StringEncoding];
    //
    //
    //NSLog(@"%@",responsestring);
    

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

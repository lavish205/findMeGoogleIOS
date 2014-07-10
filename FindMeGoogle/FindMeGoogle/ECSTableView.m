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
@interface ECSTableView ()
<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,retain) ECSPlaceDetail *placeDetail;
@property (nonatomic, retain) ECSJSONPlaceSearch * searchObject;
@property (nonatomic,retain)NSMutableArray * name;
@property (nonatomic,retain)NSMutableArray * desc;
@property (nonatomic,retain)NSMutableArray *icon;
@property (nonatomic,retain)NSMutableArray *place_id;
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
    self.place_id = [[NSMutableArray alloc]init];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
   for (Result * result in self.searchObject.results)
   {

       [self.name addObject:result.name];
       [self.desc addObject:result.vicinity];
       [self.icon addObject:result.icon];
       [self.place_id addObject:result.placeId];
   }
    NSLog(@"%@",[self.icon description]);
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
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [self.name objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [self.name objectAtIndex:indexPath.row];
    NSURL *url = [NSURL URLWithString:[self.icon objectAtIndex:indexPath.row]];
  
    [cell.imageView setImageWithURL:url];
  
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

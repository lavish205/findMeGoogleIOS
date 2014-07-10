//
//  ECSPlaceDetailCustomCell.m
//  FindMeGoogle
//
//  Created by Developer on 10/07/14.
//  Copyright (c) 2014 Lavish Aggarwal. All rights reserved.
//

#import "ECSPlaceDetailCustomCell.h"
#import "Review.h"
@interface ECSPlaceDetailCustomCell ()
@property (nonatomic,retain) NSMutableArray *array;
@property (nonatomic,retain) Review *review;
@property (weak, nonatomic) IBOutlet UILabel *txtAuthorName;
@property (weak, nonatomic) IBOutlet UILabel *txturl;
@property (weak, nonatomic) IBOutlet UILabel *txtUserRating;


@end
@implementation ECSPlaceDetailCustomCell

-(void)bindDataWithReviews:(Review *)reviews andController:(UIViewController *)controller
{

 
    self.txtAuthorName.text = reviews.authorName;
    self.txturl.text = reviews.authorUrl;
    self.txtUserRating.text = [NSString stringWithFormat:@"%@",reviews.rating ];
  
}
@end

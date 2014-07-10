//
//  ECSPlaceDetailCustomCell.h
//  FindMeGoogle
//
//  Created by Developer on 10/07/14.
//  Copyright (c) 2014 Lavish Aggarwal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ECSPlaceDetail.h"
@class Review;
@interface ECSPlaceDetailCustomCell : UITableViewCell

-(void)bindDataWithReviews:(Review *)reviews andController:(UIViewController *)controller;
@end

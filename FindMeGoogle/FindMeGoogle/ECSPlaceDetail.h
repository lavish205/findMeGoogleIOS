//
//  ECSPlaceDetail.h
//  FindMeGoogle
//
//  Created by Developer on 08/07/14.
//  Copyright (c) 2014 Lavish Aggarwal. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ECSJSONPlaceSearch;
@class ECSPlaceDetailCustomCell;

@interface ECSPlaceDetail : UIViewController
-(id)initWithPlaceId:(NSString *)placeID;
@property (weak, nonatomic) IBOutlet ECSPlaceDetailCustomCell *listCell;

@end

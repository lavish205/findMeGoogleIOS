//
//  ECSAppDelegate.h
//  FindMeGoogle
//
//  Created by Developer on 03/07/14.
//  Copyright (c) 2014 Lavish Aggarwal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>
#import "ECSLandingPage.h"
@interface ECSAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong,nonatomic) ECSLandingPage *viewController;
@property (strong,nonatomic) UINavigationController *navigationController;
@end

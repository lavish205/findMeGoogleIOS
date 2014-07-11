//
//  ECSHelper.m
//  TME
//
//  Created by Shreesh Garg on 03/12/13.
//  Copyright (c) 2013 Shreesh Garg. All rights reserved.
//

#import "ECSConfig.h"
#import "ECSHelper.h"
#import "UIExtensions.h"
#import <MessageUI/MessageUI.h>
#import <Accounts/Accounts.h>
#import <Social/Social.h>
#import <Twitter/Twitter.h>
#import "ECSConfig.h"

@interface ECSHelper () <UIActionSheetDelegate>
@property (nonatomic, strong) UIActionSheet * actionSheet;
@property (nonatomic, retain) UIViewController * controller;
@end

@implementation ECSHelper

+(void)setMayanmarTimeOnLabel:(UILabel *)lbl
{
    NSMutableDictionary * dictionary = [[NSMutableDictionary alloc]init];
    [dictionary setValue:lbl forKey:@"label"];
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(doGetMayanmarTime:) userInfo:dictionary repeats:YES];
  //  NSTimer *timer = [[NSTimer alloc]initWithFireDate:[NSDate date] interval:0.1 target:self    ];
}

+(void)doGetMayanmarTime:(NSTimer *)timer
{
    NSMutableDictionary * dictionary = [timer userInfo];
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc]init];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:23400]];
    [dateFormatter setDateFormat:@"hh:mm a"];
    UILabel * label= [dictionary valueForKey:@"label"];
    [label setText:[NSString stringWithFormat:@"%@",[dateFormatter stringFromDate:[NSDate date]]]];

}

+(NSString *)getDeviceId
{
   return @"12345";
}
+(NSString *)getDeviceName
{
   return @"ios";
}

@end


@implementation ECSAlert

+(void)showAlert:(NSString *)message
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:kAppName message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];


}


+(void)showAlert:(NSString *)message withDelegate:(UIViewController *)ctrl andTag:(int)tag
{

    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:kAppName message:message delegate:ctrl cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert setTag:tag];
    [alert show];

}

@end


@implementation ECSUserDefault


// get the values from user defaults

+(BOOL)getBoolFromUserDefaultForKey:(NSString *)string
{
    return [[NSUserDefaults standardUserDefaults]boolForKey:string];

}
+(int)getIntFromUserDefaultForKey:(NSString *)string{
    
    return [[NSUserDefaults standardUserDefaults]integerForKey:string];

}
+(NSString *)getStringFromUserDefaultForKey:(NSString *)string{

    return [[NSUserDefaults standardUserDefaults]stringForKey:string];

}
+(float)getFloatFromUserDefaultForKey:(NSString *)string{
 
    return [[NSUserDefaults standardUserDefaults]floatForKey:string];

}
+(id)getObjectFromUserDefaultForKey:(NSString *)string{

   return [[NSUserDefaults standardUserDefaults]objectForKey:string];
    
}

// svae the values to user defaults 


+(void)saveBool:(BOOL)val ToUserDefaultForKey:(NSString *)string{
    
    [[NSUserDefaults standardUserDefaults]setBool:val forKey:string];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
}

+(void)saveInt:(int)val ToUserDefaultForKey:(NSString *)string
{
    [[NSUserDefaults standardUserDefaults]setInteger:val forKey:string];
    [[NSUserDefaults standardUserDefaults]synchronize];
}


+(void)saveString:(NSString *)val ToUserDefaultForKey:(NSString *)string
{
    [[NSUserDefaults standardUserDefaults]setObject:val forKey:string];
    [[NSUserDefaults standardUserDefaults]synchronize];
}


+(void)saveFloat :(float)val ToUserDefaultForKey:(NSString *)string
{
    [[NSUserDefaults standardUserDefaults]setFloat:val forKey:string];
    [[NSUserDefaults standardUserDefaults]synchronize];
}


+(void)saveObject:(id)val ToUserDefaultForKey:(NSString *)string
{
    [[NSUserDefaults standardUserDefaults]setObject:val forKey:string];
    [[NSUserDefaults standardUserDefaults]synchronize];
}





@end


// Implementation of ecsdate helper



@implementation ECSDate

+(NSDate *)dateAfterYear:(int)y month:(int)m day:(int)d fromDate:(NSDate *)date
{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setYear:y];
    [offsetComponents setMonth:m];
    [offsetComponents setDay:d];
    NSDate *calculatedDate = [gregorian dateByAddingComponents:offsetComponents toDate:date options:0];
    return calculatedDate;
    
    
}

+(NSString *)getFormattedDateString:(NSDate *)date
{
     NSDateFormatter *formatter = nil;
     formatter = [[NSDateFormatter alloc]init];
     [formatter setDateFormat:@"yyyy-MM-dd"];
     NSString *string = [formatter stringFromDate:date];formatter = nil;
     return string;
}


+(NSString *)getStringFromDate:(NSDate *)date inFormat:(NSString *)formString
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:formString];
    NSString *string = [formatter stringFromDate:date];
    return string;
}

@end


@implementation ECSDevice

+(BOOL)isiOS7
{
  if([[UIDevice currentDevice].systemVersion floatValue] >= 7.0)
      return YES;
  else return NO;
}
+(BOOL)isiOS6
{
    if([[UIDevice currentDevice].systemVersion floatValue] >= 6.0)
        return YES;
    else return NO;
}
+(BOOL)isiOS5
{
    if([[UIDevice currentDevice].systemVersion floatValue] >= 5.0)
        return YES;
    else return NO;
}
+(float)iOSVersion
{
    return [[UIDevice currentDevice].systemVersion floatValue];
}
@end


//
//  ECSHelper.h
//  TME
//
//  Created by Shreesh Garg on 03/12/13.
//  Copyright (c) 2013 Shreesh Garg. All rights reserved.
//


typedef enum
{
    Music = 0,
    Video = 1,
    TV= 2

}AlbumType;


#import <Foundation/Foundation.h>
@class NewsObject;



@interface ECSHelper : NSObject
@property (nonatomic, strong) ECSHelper * delegate;

+(void)setMayanmarTimeOnLabel:(UILabel *)lbl;
+(NSString *)getDeviceId;
+(NSString *)getDeviceName;
//-(void)showShareOptionActionSheet:(UIViewController *)controller;
//-(void)showSupportMailComposer:(UIViewController *)control;

@end


@interface ECSAlert : NSObject

+(void)showAlert:(NSString *)message;
+(void)showAlert:(NSString *)message withDelegate:(UIViewController *)ctrl andTag:(int)tag;

@end




@interface ECSUserDefault: NSObject

+(BOOL)getBoolFromUserDefaultForKey:(NSString *)string;
+(int)getIntFromUserDefaultForKey:(NSString *)string;
+(NSString *)getStringFromUserDefaultForKey:(NSString *)string;
+(float)getFloatFromUserDefaultForKey:(NSString *)string;
+(id)getObjectFromUserDefaultForKey:(NSString *)string;


+(void)saveBool:(BOOL)val ToUserDefaultForKey:(NSString *)string;
+(void)saveInt:(int)val ToUserDefaultForKey:(NSString *)string;
+(void)saveString:(NSString *)val ToUserDefaultForKey:(NSString *)string;
+(void)saveFloat :(float)val ToUserDefaultForKey:(NSString *)string;
+(void)saveObject:(id)val ToUserDefaultForKey:(NSString *)string;

@end



@interface ECSDate : NSObject

+(NSDate *)dateAfterYear:(int)y month:(int)m day:(int)d fromDate:(NSDate *)date;
+(NSString *)getFormattedDateString:(NSDate *)date;
+(NSString *)getStringFromDate:(NSDate *)date inFormat:(NSString *)formString;
@end


@interface ECSDevice : NSObject

+(BOOL)isiOS7;
+(BOOL)isiOS6;
+(BOOL)isiOS5;
+(float)iOSVersion;
@end






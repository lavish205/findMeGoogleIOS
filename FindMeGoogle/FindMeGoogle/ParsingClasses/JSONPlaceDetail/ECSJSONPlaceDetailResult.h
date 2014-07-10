#import <Foundation/Foundation.h>

@class ECSJSONPlaceDetailResultGeometry;

@interface ECSJSONPlaceDetailResult : NSObject {

    NSArray *addressComponents;
    NSString *adrAddress;
    NSString *formattedAddress;
    NSString *formattedPhoneNumber;
    ECSJSONPlaceDetailResultGeometry *geometry;
    NSString *icon;
    NSString *eCSJSONPlaceDetailResultId;
    NSString *internationalPhoneNumber;
    NSString *name;
    NSArray *photos;
    NSString *placeId;
    NSNumber *rating;
    NSString *reference;
    NSArray *reviews;
    NSString *scope;
    NSArray *types;
    NSString *url;
    NSNumber *userRatingsTotal;
    NSNumber *utcOffset;
    NSString *vicinity;
    NSString *website;

}

@property (nonatomic, copy) NSArray *addressComponents;
@property (nonatomic, copy) NSString *adrAddress;
@property (nonatomic, copy) NSString *formattedAddress;
@property (nonatomic, copy) NSString *formattedPhoneNumber;
@property (nonatomic, strong) ECSJSONPlaceDetailResultGeometry *geometry;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *eCSJSONPlaceDetailResultId;
@property (nonatomic, copy) NSString *internationalPhoneNumber;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSArray *photos;
@property (nonatomic, copy) NSString *placeId;
@property (nonatomic, copy) NSNumber *rating;
@property (nonatomic, copy) NSString *reference;
@property (nonatomic, copy) NSArray *reviews;
@property (nonatomic, copy) NSString *scope;
@property (nonatomic, copy) NSArray *types;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSNumber *userRatingsTotal;
@property (nonatomic, copy) NSNumber *utcOffset;
@property (nonatomic, copy) NSString *vicinity;
@property (nonatomic, copy) NSString *website;

+ (ECSJSONPlaceDetailResult *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

@end

#import <Foundation/Foundation.h>

@class ECSJSONPlaceDetailResultGeometryLocation;

@interface ECSJSONPlaceDetailResultGeometry : NSObject {

    ECSJSONPlaceDetailResultGeometryLocation *location;

}

@property (nonatomic, strong) ECSJSONPlaceDetailResultGeometryLocation *location;

+ (ECSJSONPlaceDetailResultGeometry *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

@end

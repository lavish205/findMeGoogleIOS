#import <Foundation/Foundation.h>

@interface ECSJSONPlaceDetailResultGeometryLocation : NSObject {

    NSNumber *lat;
    NSNumber *lng;

}

@property (nonatomic, copy) NSNumber *lat;
@property (nonatomic, copy) NSNumber *lng;

+ (ECSJSONPlaceDetailResultGeometryLocation *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

@end

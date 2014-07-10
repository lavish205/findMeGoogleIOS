#import "ECSJSONPlaceDetailResultGeometryLocation.h"

@implementation ECSJSONPlaceDetailResultGeometryLocation
+ (ECSJSONPlaceDetailResultGeometryLocation *)instanceFromDictionary:(NSDictionary *)aDictionary {

    ECSJSONPlaceDetailResultGeometryLocation *instance = [[ECSJSONPlaceDetailResultGeometryLocation alloc] init];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;

}

- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary {

    if (![aDictionary isKindOfClass:[NSDictionary class]]) {
        return;
    }

    self.lat = [aDictionary objectForKey:@"lat"];
    self.lng = [aDictionary objectForKey:@"lng"];

}


@end

#import "ECSJSONPlaceDetailResultGeometry.h"

#import "ECSJSONPlaceDetailResultGeometryLocation.h"

@implementation ECSJSONPlaceDetailResultGeometry
+ (ECSJSONPlaceDetailResultGeometry *)instanceFromDictionary:(NSDictionary *)aDictionary {

    ECSJSONPlaceDetailResultGeometry *instance = [[ECSJSONPlaceDetailResultGeometry alloc] init];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;

}

- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary {

    if (![aDictionary isKindOfClass:[NSDictionary class]]) {
        return;
    }

    self.location = [ECSJSONPlaceDetailResultGeometryLocation instanceFromDictionary:[aDictionary objectForKey:@"location"]];

}


@end

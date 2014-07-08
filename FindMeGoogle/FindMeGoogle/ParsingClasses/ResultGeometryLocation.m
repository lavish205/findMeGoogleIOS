#import "ResultGeometryLocation.h"

@implementation ResultGeometryLocation
+ (ResultGeometryLocation *)instanceFromDictionary:(NSDictionary *)aDictionary {

    ResultGeometryLocation *instance = [[ResultGeometryLocation alloc] init];
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

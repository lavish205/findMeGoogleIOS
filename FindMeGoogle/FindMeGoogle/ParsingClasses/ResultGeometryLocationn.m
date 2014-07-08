#import "ResultGeometryLocationn.h"

@implementation ResultGeometryLocationn
+ (ResultGeometryLocationn *)instanceFromDictionary:(NSDictionary *)aDictionary {

    ResultGeometryLocationn *instance = [[ResultGeometryLocationn alloc] init];
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

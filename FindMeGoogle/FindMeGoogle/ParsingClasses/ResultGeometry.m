#import "ResultGeometry.h"

#import "ResultGeometryLocationn.h"

@implementation ResultGeometry
+ (ResultGeometry *)instanceFromDictionary:(NSDictionary *)aDictionary {

    ResultGeometry *instance = [[ResultGeometry alloc] init];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;

}

- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary {

    if (![aDictionary isKindOfClass:[NSDictionary class]]) {
        return;
    }

    self.location = [ResultGeometryLocationn instanceFromDictionary:[aDictionary objectForKey:@"location"]];

}


@end

#import "Result.h"

#import "ResultGeometry.h"

@implementation Result
+ (Result *)instanceFromDictionary:(NSDictionary *)aDictionary {

    Result *instance = [[Result alloc] init];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;

}

- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary {

    if (![aDictionary isKindOfClass:[NSDictionary class]]) {
        return;
    }

    self.geometry = [ResultGeometry instanceFromDictionary:[aDictionary objectForKey:@"geometry"]];
    self.icon = [aDictionary objectForKey:@"icon"];
    self.name = [aDictionary objectForKey:@"name"];
    self.placeId = [aDictionary objectForKey:@"place_id"];
    self.reference = [aDictionary objectForKey:@"reference"];
    self.resultId = [aDictionary objectForKey:@"id"];
    self.scope = [aDictionary objectForKey:@"scope"];

    NSArray *receivedTypes = [aDictionary objectForKey:@"types"];
    if ([receivedTypes isKindOfClass:[NSArray class]]) {

        NSMutableArray *populatedTypes = [NSMutableArray arrayWithCapacity:[receivedTypes count]];
        for (NSDictionary *item in receivedTypes) {
            [populatedTypes addObject:item];
        }

        self.types = populatedTypes;

    }
    self.vicinity = [aDictionary objectForKey:@"vicinity"];

}


@end

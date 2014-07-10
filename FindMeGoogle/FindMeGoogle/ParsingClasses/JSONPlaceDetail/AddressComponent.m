#import "AddressComponent.h"

@implementation AddressComponent
+ (AddressComponent *)instanceFromDictionary:(NSDictionary *)aDictionary {

    AddressComponent *instance = [[AddressComponent alloc] init];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;

}

- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary {

    if (![aDictionary isKindOfClass:[NSDictionary class]]) {
        return;
    }

    self.longName = [aDictionary objectForKey:@"long_name"];
    self.shortName = [aDictionary objectForKey:@"short_name"];

    NSArray *receivedTypes = [aDictionary objectForKey:@"types"];
    if ([receivedTypes isKindOfClass:[NSArray class]]) {

        NSMutableArray *populatedTypes = [NSMutableArray arrayWithCapacity:[receivedTypes count]];
        for (NSDictionary *item in receivedTypes) {
            [populatedTypes addObject:item];
        }

        self.types = populatedTypes;

    }

}


@end

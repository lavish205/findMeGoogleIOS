#import "Aspect.h"

@implementation Aspect
+ (Aspect *)instanceFromDictionary:(NSDictionary *)aDictionary {

    Aspect *instance = [[Aspect alloc] init];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;

}

- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary {

    if (![aDictionary isKindOfClass:[NSDictionary class]]) {
        return;
    }

    self.rating = [aDictionary objectForKey:@"rating"];
    self.type = [aDictionary objectForKey:@"type"];

}


@end

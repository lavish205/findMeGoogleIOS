#import "Review.h"

#import "Aspect.h"

@implementation Review
+ (Review *)instanceFromDictionary:(NSDictionary *)aDictionary {

    Review *instance = [[Review alloc] init];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;

}

- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary {

    if (![aDictionary isKindOfClass:[NSDictionary class]]) {
        return;
    }


    NSArray *receivedAspects = [aDictionary objectForKey:@"aspects"];
    if ([receivedAspects isKindOfClass:[NSArray class]]) {

        NSMutableArray *populatedAspects = [NSMutableArray arrayWithCapacity:[receivedAspects count]];
        for (NSDictionary *item in receivedAspects) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [populatedAspects addObject:[Aspect instanceFromDictionary:item]];
            }
        }

        self.aspects = populatedAspects;

    }
    self.authorName = [aDictionary objectForKey:@"author_name"];
    self.authorUrl = [aDictionary objectForKey:@"author_url"];
    self.language = [aDictionary objectForKey:@"language"];
    self.rating = [aDictionary objectForKey:@"rating"];
    self.text = [aDictionary objectForKey:@"text"];
    self.time = [aDictionary objectForKey:@"time"];

}


@end

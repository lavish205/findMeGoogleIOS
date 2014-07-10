#import "Photo.h"

@implementation Photo
+ (Photo *)instanceFromDictionary:(NSDictionary *)aDictionary {

    Photo *instance = [[Photo alloc] init];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;

}

- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary {

    if (![aDictionary isKindOfClass:[NSDictionary class]]) {
        return;
    }

    self.height = [aDictionary objectForKey:@"height"];

    NSArray *receivedHtmlAttributions = [aDictionary objectForKey:@"html_attributions"];
    if ([receivedHtmlAttributions isKindOfClass:[NSArray class]]) {

        NSMutableArray *populatedHtmlAttributions = [NSMutableArray arrayWithCapacity:[receivedHtmlAttributions count]];
        for (NSDictionary *item in receivedHtmlAttributions) {
            [populatedHtmlAttributions addObject:item];
        }

        self.htmlAttributions = populatedHtmlAttributions;

    }
    self.photoReference = [aDictionary objectForKey:@"photo_reference"];
    self.width = [aDictionary objectForKey:@"width"];

}


@end

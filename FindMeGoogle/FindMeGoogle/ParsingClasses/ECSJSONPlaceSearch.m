#import "ECSJSONPlaceSearch.h"

#import "Result.h"

@implementation ECSJSONPlaceSearch
+ (ECSJSONPlaceSearch *)instanceFromDictionary:(NSDictionary *)aDictionary {

    ECSJSONPlaceSearch *instance = [[ECSJSONPlaceSearch alloc] init];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;

}

- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary {

    if (![aDictionary isKindOfClass:[NSDictionary class]]) {
        return;
    }


    NSArray *receivedHtmlAttributions = [aDictionary objectForKey:@"html_attributions"];
    if ([receivedHtmlAttributions isKindOfClass:[NSArray class]]) {

        NSMutableArray *populatedHtmlAttributions = [NSMutableArray arrayWithCapacity:[receivedHtmlAttributions count]];
        for (NSDictionary *item in receivedHtmlAttributions) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                #warning This array can contain members of varying types. Since your preference is set to not merge array (and thus set) models, which type to use for a given member is ambiguous, so no assignment occurs here. Sample assignments have been provided.
            }
        }

        self.htmlAttributions = populatedHtmlAttributions;

    }
    self.nextPageToken = [aDictionary objectForKey:@"next_page_token"];

    NSArray *receivedResults = [aDictionary objectForKey:@"results"];
    if ([receivedResults isKindOfClass:[NSArray class]]) {

        NSMutableArray *populatedResults = [NSMutableArray arrayWithCapacity:[receivedResults count]];
        for (NSDictionary *item in receivedResults) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [populatedResults addObject:[Result instanceFromDictionary:item]];
            }
        }

        self.results = populatedResults;

    }
    self.status = [aDictionary objectForKey:@"status"];

}


@end

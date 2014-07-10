#import "ECSJSONPlaceDetail.h"

#import "ECSJSONPlaceDetailResult.h"

@implementation ECSJSONPlaceDetail
+ (ECSJSONPlaceDetail *)instanceFromDictionary:(NSDictionary *)aDictionary {

    ECSJSONPlaceDetail *instance = [[ECSJSONPlaceDetail alloc] init];
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
    self.result = [ECSJSONPlaceDetailResult instanceFromDictionary:[aDictionary objectForKey:@"result"]];
    self.status = [aDictionary objectForKey:@"status"];

}


@end

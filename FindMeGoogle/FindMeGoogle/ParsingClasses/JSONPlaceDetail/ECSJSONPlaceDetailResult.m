#import "ECSJSONPlaceDetailResult.h"

#import "AddressComponent.h"
#import "ECSJSONPlaceDetailResultGeometry.h"
#import "Photo.h"
#import "Review.h"

@implementation ECSJSONPlaceDetailResult
+ (ECSJSONPlaceDetailResult *)instanceFromDictionary:(NSDictionary *)aDictionary {

    ECSJSONPlaceDetailResult *instance = [[ECSJSONPlaceDetailResult alloc] init];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;

}

- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary {

    if (![aDictionary isKindOfClass:[NSDictionary class]]) {
        return;
    }


    NSArray *receivedAddressComponents = [aDictionary objectForKey:@"address_components"];
    if ([receivedAddressComponents isKindOfClass:[NSArray class]]) {

        NSMutableArray *populatedAddressComponents = [NSMutableArray arrayWithCapacity:[receivedAddressComponents count]];
        for (NSDictionary *item in receivedAddressComponents) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [populatedAddressComponents addObject:[AddressComponent instanceFromDictionary:item]];
            }
        }

        self.addressComponents = populatedAddressComponents;

    }
    self.adrAddress = [aDictionary objectForKey:@"adr_address"];
    self.formattedAddress = [aDictionary objectForKey:@"formatted_address"];
    self.formattedPhoneNumber = [aDictionary objectForKey:@"formatted_phone_number"];
    self.geometry = [ECSJSONPlaceDetailResultGeometry instanceFromDictionary:[aDictionary objectForKey:@"geometry"]];
    self.icon = [aDictionary objectForKey:@"icon"];
    self.eCSJSONPlaceDetailResultId = [aDictionary objectForKey:@"id"];
    self.internationalPhoneNumber = [aDictionary objectForKey:@"international_phone_number"];
    self.name = [aDictionary objectForKey:@"name"];

    NSArray *receivedPhotos = [aDictionary objectForKey:@"photos"];
    if ([receivedPhotos isKindOfClass:[NSArray class]]) {

        NSMutableArray *populatedPhotos = [NSMutableArray arrayWithCapacity:[receivedPhotos count]];
        for (NSDictionary *item in receivedPhotos) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [populatedPhotos addObject:[Photo instanceFromDictionary:item]];
            }
        }

        self.photos = populatedPhotos;

    }
    self.placeId = [aDictionary objectForKey:@"place_id"];
    self.rating = [aDictionary objectForKey:@"rating"];
    self.reference = [aDictionary objectForKey:@"reference"];

    NSArray *receivedReviews = [aDictionary objectForKey:@"reviews"];
    if ([receivedReviews isKindOfClass:[NSArray class]]) {

        NSMutableArray *populatedReviews = [NSMutableArray arrayWithCapacity:[receivedReviews count]];
        for (NSDictionary *item in receivedReviews) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [populatedReviews addObject:[Review instanceFromDictionary:item]];
            }
        }

        self.reviews = populatedReviews;

    }
    self.scope = [aDictionary objectForKey:@"scope"];

    NSArray *receivedTypes = [aDictionary objectForKey:@"types"];
    if ([receivedTypes isKindOfClass:[NSArray class]]) {

        NSMutableArray *populatedTypes = [NSMutableArray arrayWithCapacity:[receivedTypes count]];
        for (NSDictionary *item in receivedTypes) {
            [populatedTypes addObject:item];
        }

        self.types = populatedTypes;

    }
    self.url = [aDictionary objectForKey:@"url"];
    self.userRatingsTotal = [aDictionary objectForKey:@"user_ratings_total"];
    self.utcOffset = [aDictionary objectForKey:@"utc_offset"];
    self.vicinity = [aDictionary objectForKey:@"vicinity"];
    self.website = [aDictionary objectForKey:@"website"];

}


@end

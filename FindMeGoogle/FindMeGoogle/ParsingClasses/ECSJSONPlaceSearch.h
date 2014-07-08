#import <Foundation/Foundation.h>

@interface ECSJSONPlaceSearch : NSObject {

    NSArray *htmlAttributions;
    NSString *nextPageToken;
    NSArray *results;
    NSString *status;

}

@property (nonatomic, copy) NSArray *htmlAttributions;
@property (nonatomic, copy) NSString *nextPageToken;
@property (nonatomic, copy) NSArray *results;
@property (nonatomic, copy) NSString *status;

+ (ECSJSONPlaceSearch *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

@end

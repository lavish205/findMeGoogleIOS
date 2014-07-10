#import <Foundation/Foundation.h>

@class ECSJSONPlaceDetailResult;

@interface ECSJSONPlaceDetail : NSObject {

    NSArray *htmlAttributions;
    ECSJSONPlaceDetailResult *result;
    NSString *status;

}

@property (nonatomic, copy) NSArray *htmlAttributions;
@property (nonatomic, strong) ECSJSONPlaceDetailResult *result;
@property (nonatomic, copy) NSString *status;

+ (ECSJSONPlaceDetail *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

@end

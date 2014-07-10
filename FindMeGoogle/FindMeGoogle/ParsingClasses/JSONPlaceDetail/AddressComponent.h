#import <Foundation/Foundation.h>

@interface AddressComponent : NSObject {

    NSString *longName;
    NSString *shortName;
    NSArray *types;

}

@property (nonatomic, copy) NSString *longName;
@property (nonatomic, copy) NSString *shortName;
@property (nonatomic, copy) NSArray *types;

+ (AddressComponent *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

@end

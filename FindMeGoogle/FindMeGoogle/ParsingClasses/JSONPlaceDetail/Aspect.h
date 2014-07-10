#import <Foundation/Foundation.h>

@interface Aspect : NSObject {

    NSNumber *rating;
    NSString *type;

}

@property (nonatomic, copy) NSNumber *rating;
@property (nonatomic, copy) NSString *type;

+ (Aspect *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

@end

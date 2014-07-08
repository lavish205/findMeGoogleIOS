#import <Foundation/Foundation.h>

@interface ResultGeometryLocationn : NSObject {

    NSNumber *lat;
    NSNumber *lng;

}

@property (nonatomic, copy) NSNumber *lat;
@property (nonatomic, copy) NSNumber *lng;

+ (ResultGeometryLocationn *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

@end

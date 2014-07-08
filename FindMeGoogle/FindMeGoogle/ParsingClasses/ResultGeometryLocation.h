#import <Foundation/Foundation.h>

@interface ResultGeometryLocation : NSObject {

    NSNumber *lat;
    NSNumber *lng;

}

@property (nonatomic, copy) NSNumber *lat;
@property (nonatomic, copy) NSNumber *lng;

+ (ResultGeometryLocation *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

@end

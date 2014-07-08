#import <Foundation/Foundation.h>

@class ResultGeometryLocationn;

@interface ResultGeometry : NSObject {

    ResultGeometryLocationn *location;

}

@property (nonatomic, strong) ResultGeometryLocationn *location;

+ (ResultGeometry *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

@end

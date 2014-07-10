#import <Foundation/Foundation.h>

@interface Photo : NSObject {

    NSNumber *height;
    NSArray *htmlAttributions;
    NSString *photoReference;
    NSNumber *width;

}

@property (nonatomic, copy) NSNumber *height;
@property (nonatomic, copy) NSArray *htmlAttributions;
@property (nonatomic, copy) NSString *photoReference;
@property (nonatomic, copy) NSNumber *width;

+ (Photo *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

@end

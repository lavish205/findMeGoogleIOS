#import <Foundation/Foundation.h>

@class ResultGeometry;

@interface Result : NSObject {

    ResultGeometry *geometry;
    NSString *icon;
    NSString *name;
    NSString *placeId;
    NSString *reference;
    NSString *resultId;
    NSString *scope;
    NSArray *types;
    NSString *vicinity;

}

@property (nonatomic, strong) ResultGeometry *geometry;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *placeId;
@property (nonatomic, copy) NSString *reference;
@property (nonatomic, copy) NSString *resultId;
@property (nonatomic, copy) NSString *scope;
@property (nonatomic, copy) NSArray *types;
@property (nonatomic, copy) NSString *vicinity;

+ (Result *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

@end

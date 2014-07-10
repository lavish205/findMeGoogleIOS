#import <Foundation/Foundation.h>

@interface Review : NSObject {

    NSArray *aspects;
    NSString *authorName;
    NSString *authorUrl;
    NSString *language;
    NSNumber *rating;
    NSString *text;
    NSNumber *time;

}

@property (nonatomic, copy) NSArray *aspects;
@property (nonatomic, copy) NSString *authorName;
@property (nonatomic, copy) NSString *authorUrl;
@property (nonatomic, copy) NSString *language;
@property (nonatomic, copy) NSNumber *rating;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSNumber *time;

+ (Review *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

@end

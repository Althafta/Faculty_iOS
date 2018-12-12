#import "HandleNullValues.h"

@implementation HandleNullValues
+ (NSString *)stringToCheckNull:(NSString *)string
{
    string = [string isKindOfClass:[NSNull class]] || string == (id)[NSNull null] || [string length] == 0
    ? @"" : string;
    return string;
}
@end

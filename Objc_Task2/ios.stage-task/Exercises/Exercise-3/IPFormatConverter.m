#import "IPFormatConverter.h"

@implementation IPFormatConverter

- (NSString *)ipFormatConverter:(NSArray *)numbersArray {
    if (numbersArray == nil || numbersArray.count == 0) {
        return @"";
    }
    
    NSString *rangeMessage = @"The numbers in the input array can be in the range from 0 to 255.";
    NSString *negativeMessage = @"Negative numbers are not valid for input.";
    NSMutableString *result = [[NSMutableString alloc] init];
    
    for (int i = 0; i < 4; i++) {
        int nextValue = 0;
        
        if (i < numbersArray.count) {
            nextValue = [numbersArray[i] intValue];
        }
        
        if (nextValue > 255) {
            return rangeMessage;
        } else if (nextValue < 0) {
            return negativeMessage;
        } else {
            [result appendFormat:@"%d.", nextValue];
        }
    }

    return [result substringToIndex:[result length] - 1];
}

@end

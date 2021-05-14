#import "ReverseBinary.h"

UInt8 ReverseInteger(UInt8 n) {
    UInt8 result = 0;
    
    for (int i = 0; i < 8; i++) {
        if ( n % 2) {
            result += pow(2, 7 - i);
        }
        n /= 2;
    }
    return result;
}

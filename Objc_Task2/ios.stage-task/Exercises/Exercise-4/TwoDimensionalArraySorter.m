#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {
    if (array == nil || array.count == 0 || ![array[0] isKindOfClass:NSArray.class]){
        return @[];
    }

    NSMutableArray<NSNumber*> *numbersArray = [[NSMutableArray alloc] init];
    NSMutableArray<NSString*> *stringsArray = [[NSMutableArray alloc] init];

    for (NSArray *innerArray in array) {
        for (id element in innerArray) {
            if ([element isKindOfClass:NSNumber.class]) {
                [numbersArray addObject:element];
            } else {
                [stringsArray addObject:element];
            }
        }
    }
    
    if (stringsArray.count == 0) {
        [numbersArray sortUsingDescriptors: [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES]]];
        
        return numbersArray;
    } else if (numbersArray.count == 0) {
        [stringsArray sortUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
        
        return stringsArray;
    }
    
    [numbersArray sortUsingDescriptors: [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES]]];

    [stringsArray sortUsingDescriptors: [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"self" ascending:NO selector:@selector(localizedCaseInsensitiveCompare:)]]];
    
    return [NSArray arrayWithObjects:numbersArray, stringsArray, nil];
}

@end

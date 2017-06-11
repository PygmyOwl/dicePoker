//
//  DiceAnalyzer.m
//  DicePoker1
//
//  Created by user on 10.01.17.
//  Copyright © 2017 Abdushev Sergey. All rights reserved.
//

#import "DiceAnalyzer.h"

@implementation DiceAnalyzer

- (NSInteger) duplicatesCounter:(NSNumber *)number fromArray:(NSArray *)dice {
    NSInteger count = 0;
    for(NSNumber *element in dice) {
        if([element isEqualToNumber:number]) {
            count++;
            NSLog(@" count %li", (long)count);
        }
    }
    return count;
}

#pragma mark = findStraightFlush;
- (BOOL) containsStraightFlushFromDiceArray:(NSArray *)dice {
    if([dice containsObject:@1] &&
       [dice containsObject:@2] &&
       [dice containsObject:@3] &&
       [dice containsObject:@4] &&
       [dice containsObject:@5]) {
        return YES;
    } else if([dice containsObject:@2] &&
              [dice containsObject:@3] &&
              [dice containsObject:@4] &&
              [dice containsObject:@5] &&
              [dice containsObject:@6]) {
        return YES;
    } else {
        return NO;
    }
}

#pragma mark = findFullHouse;
- (BOOL) containsFullHouseFromDiceArray:(NSArray *)dice {
    NSArray *diceSidesFullHouse = @[@1, @2, @3, @4, @5, @6];
    NSNumber *number = [[NSNumber alloc] init];
    NSInteger findCount = 0;
    BOOL wasDouble = false;
    BOOL wasTriple = false;
    for(NSNumber *element in diceSidesFullHouse){
        number = element;
        NSInteger duplicates = [self duplicatesCounter:number fromArray:dice];
        if(duplicates == 3 && !wasTriple) {
            wasTriple = true;
            findCount++;
        }
        if (duplicates == 2 && !wasDouble) {
            wasDouble = true;
            findCount++;
        }
    }
    if(findCount == 2) {
        return YES;
    } else {
        return NO;
    }
}

#pragma mark = findTwoPairs;
- (BOOL) containsTwoPairsFromDiceArray:(NSArray *)dice {
    NSArray *diceSidesFullHouse = @[@1, @2, @3, @4, @5, @6];
    NSNumber *number = [[NSNumber alloc] init];
    NSInteger findCount = 0;
    for(NSNumber *element in diceSidesFullHouse) {
        number = element;
        if ([self duplicatesCounter:number fromArray:dice] == 2) {
            findCount++;
        }
    }
    if(findCount == 2) {
        return YES;
    } else {
        return NO;
    }
}

#pragma mark = findDuplicates;
- (NSInteger) cointainsNumberOfDuplicatesFromDiceArray:(NSArray *)dice {
    NSArray *diceSidesDuplicates = @[@1, @2, @3, @4, @5, @6];
    NSNumber *number = [[NSNumber alloc] init];
    NSInteger equalCount = 0;
    for(NSNumber *element in diceSidesDuplicates){
        number = element;
        NSInteger duplicates = [self duplicatesCounter:number fromArray:dice];
        if (duplicates >= 2 && duplicates <= 4) {
            equalCount = duplicates;
        }
    }
    return equalCount;
}

#pragma mark = analyzedice;
- (NSString *)analyzeDiceFromDiceArray:(NSArray *)dice {
    if([self containsStraightFlushFromDiceArray:dice]) {
        return @"Found straight flush.";
    } else if([self containsFullHouseFromDiceArray:dice]) {
        return @"Found full house.";
    } else if([self cointainsNumberOfDuplicatesFromDiceArray:dice] == 4) {
       return @"Found 4 equal.";
    } else if([self containsTwoPairsFromDiceArray:dice]){
        return @"Found two pairs.";
    } else if([self cointainsNumberOfDuplicatesFromDiceArray:dice] == 3) {
        return @"Found three equal.";
    } else if([self cointainsNumberOfDuplicatesFromDiceArray:dice] == 2 ) {
        return @"Found pair.";
    }
    return @"Found nothing.";
}

@end

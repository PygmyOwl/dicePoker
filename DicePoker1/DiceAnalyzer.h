//
//  DiceAnalyzer.h
//  DicePoker1
//
//  Created by user on 10.01.17.
//  Copyright © 2017 Abdushev Sergey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DiceAnalyzer : NSObject

- (NSInteger) duplicatesCounter:(NSNumber *)number fromArray:(NSArray *)dice;
- (BOOL) containsStraightFlushFromDiceArray:(NSArray *)dice;
- (BOOL) containsFullHouseFromDiceArray:(NSArray *)dice;
- (BOOL) containsTwoPairsFromDiceArray:(NSArray *)dice;
- (NSInteger) cointainsNumberOfDuplicatesFromDiceArray:(NSArray *)dice;
- (NSString *)analyzeDiceFromDiceArray:(NSArray *)dice;

@end

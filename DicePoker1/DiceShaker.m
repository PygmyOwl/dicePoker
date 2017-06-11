//
//  DiceShaker.m
//  DicePoker1
//
//  Created by user on 10.01.17.
//  Copyright © 2017 Abdushev Sergey. All rights reserved.
//

#import "DiceShaker.h"

@implementation DiceShaker

- (NSInteger) shakeDie {
    NSInteger diceNumber = arc4random() % 6 + 1;
    return diceNumber;
}

- (NSMutableArray *) throwDice {
    NSMutableArray *diceNumbers = [NSMutableArray new];
    for(int i = 0; i < 5; i++) {
        NSInteger diceNum = [self shakeDie];
        [diceNumbers addObject:@(diceNum)];
    }
    return diceNumbers;
}

@end

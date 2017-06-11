//
//  DiceGameController.m
//  DicePoker1
//
//  Created by user on 23.01.17.
//  Copyright © 2017 Abdushev Sergey. All rights reserved.
//

#import "DiceGameController.h"
#import "DiceShaker.h"
#import "DiceAnalyzer.h"

@interface DiceGameController ()

@property (strong, nonatomic) DiceShaker *shaker;
@property (strong, nonatomic) DiceAnalyzer *analyzer;

@end

@implementation DiceGameController

- (id) init {
    if(self = [super init]) {
        self.shaker = [[DiceShaker alloc] init];
        self.analyzer = [[DiceAnalyzer alloc] init];
    }
    return self;
}

- (void) startGame{
    self.diceNumbers = [self.shaker throwDice];
    self.results = [self.analyzer analyzeDiceFromDiceArray:self.diceNumbers];
}

@end

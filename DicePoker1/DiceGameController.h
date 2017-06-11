//
//  DiceGameController.h
//  DicePoker1
//
//  Created by user on 23.01.17.
//  Copyright © 2017 Abdushev Sergey. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DiceShaker;
@class DiceAnalyzer;

@interface DiceGameController : NSObject

@property (strong, nonatomic) NSString *results;
@property (strong, nonatomic) NSArray *diceNumbers;

- (void) startGame;

@end

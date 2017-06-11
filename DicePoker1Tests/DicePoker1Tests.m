//
//  DicePoker1Tests.m
//  DicePoker1Tests
//
//  Created by user on 25.01.17.
//  Copyright © 2017 Abdushev Sergey. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DiceAnalyzer.h"

@interface DicePoker1Tests : XCTestCase

@property (strong, nonatomic) DiceAnalyzer *analyzer;

@end

@implementation DicePoker1Tests

- (NSArray *) testDiceArrayStraightFlush {
    return @[@1, @2, @3, @4, @5];
}

- (NSArray *) testDiceArrayFullHouse {
    return @[@3, @3, @4, @3, @4];
}

- (NSArray *) testDiceArrayPair {
    return @[@6, @4, @99, @6, @0];
}

- (NSArray *) testDiceArrayTwoPairs {
    return @[@1, @6, @1, @6, @5];
}

- (NSArray *) testDiceArrayThreeOf {
    return @[@1, @5, @3, @5, @5];
}

- (NSArray *) testDiceArrayFourOf {
    return @[@6, @6, @4, @6, @6];
}

- (NSArray *) tetsDiceArrayFiveOf {
    return @[@55, @55, @55, @55, @55];
}

- (NSArray *) testByNothing {
    return @[ @1, @2, @3, @6, @4 ];
}

- (void)setUp {
    [super setUp];
    self.analyzer = [DiceAnalyzer new];
}

- (void) test_findStraightFlush {
    BOOL straightFlushFound = [self.analyzer findStraightFlushFromDiceArray:[self testDiceArrayStraightFlush]];
    XCTAssertTrue(straightFlushFound);
}

- (void) test_findFullHouse {
    BOOL fullHouseFound = [self.analyzer findFullHouseFromDiceArray:[self testDiceArrayFullHouse]];
    XCTAssertTrue(fullHouseFound);
}

- (void) test_findTwoPairs {
    BOOL twoPairsFound = [self.analyzer findTwoPairsFromDiceArray:[self testDiceArrayTwoPairs]];
    XCTAssertTrue(twoPairsFound);
}

- (void) test_findPair {
    NSInteger foundTwo = [self.analyzer findDuplicatesFromDiceArray:[self testDiceArrayPair]];
    XCTAssertTrue(foundTwo == 2);
}

- (void) test_findThree {
    NSInteger foundThree = [self.analyzer findDuplicatesFromDiceArray:[self testDiceArrayThreeOf]];
    XCTAssertTrue(foundThree == 3);
}

- (void) test_findFourOf {
    NSInteger foundFour = [self.analyzer findDuplicatesFromDiceArray:[self testDiceArrayFourOf]];
    XCTAssertTrue(foundFour == 4);
}

- (void) test_analyzeDices {
    NSString *testResults = @"Find nothing.";
    NSString *analyzeResults = [self.analyzer analyzeDiceFromDiceArray:[self testByNothing]];
    BOOL result = [testResults isEqualToString:analyzeResults];
    XCTAssertTrue(result);
}

@end

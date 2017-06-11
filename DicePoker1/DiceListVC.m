//
//  DiceListVC.m
//  DicePoker1
//
//  Created by user on 30.01.17.
//  Copyright © 2017 Abdushev Sergey. All rights reserved.
//

#import "DiceListVC.h"
#import "DiceGameController.h"

@interface DiceListVC () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *resultsTableView;
@property (strong, nonatomic) IBOutlet UILabel *combinationNameLabel;

@property (strong, nonatomic) DiceGameController *gameController;
@property (strong, nonatomic) NSArray *diceCombination;

@end

@implementation DiceListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gameController = [[DiceGameController alloc] init];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void) combinationNameContentConfig {
    self.diceCombination = [self.gameController diceNumbers];
    self.combinationNameLabel.text = [self.gameController results];
    UIFont *combinationNameLabelFont = [ UIFont fontWithName: @"Arial" size: 18.0 ];
    self.combinationNameLabel.font  = combinationNameLabelFont;
}

- (void) showAlertControllerContent {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Your results :"
                                                                   message:[self.gameController results]
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* actionOk = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction *action) {}];
    [alert addAction:actionOk];
    [self presentViewController:alert animated:YES completion:nil];
}

- (IBAction)throwDiceAction:(id)sender {
    [self.gameController startGame];
    [self combinationNameContentConfig];
    [self.resultsTableView reloadData];
    [self showAlertControllerContent];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.diceCombination.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"diceIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier
                                                            forIndexPath:indexPath];
    cell.textLabel.text = [[self.diceCombination objectAtIndex:indexPath.row]stringValue];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    UIFont *textLabelFont = [ UIFont fontWithName: @"Arial" size: 18.0 ];
    cell.textLabel.font  = textLabelFont;
    cell.autoresizingMask = UIViewAutoresizingFlexibleWidth |
                            UIViewAutoresizingFlexibleHeight |
                            UIViewAutoresizingFlexibleLeftMargin |
                            UIViewAutoresizingFlexibleRightMargin;
    
    return cell;
}

- (BOOL) shouldAutorotate {
    return YES;
}



@end

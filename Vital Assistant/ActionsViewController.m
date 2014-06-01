//
//  ActionsViewController.m
//  Vital Assistant
//
//  Created by George Purusniuc on 01/06/14.
//  Copyright (c) 2014 George Purusniuc. All rights reserved.
//

#import "ActionsViewController.h"
#import "MealsViewController.h"
#import "CardiacViewController.h"
#import "WorkoutViewController.h"
#import "MoodViewController.h"

@interface ActionsViewController ()

@property (strong, nonatomic) NSArray *tableContent;

@end

@implementation ActionsViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableContent = @[@"Meals", @"Cardiac", @"Workouts", @"Mood"];
}

#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.tableContent count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellIdentifier"];
    
    cell.textLabel.text = self.tableContent[indexPath.row];
    return cell;
}

#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            [self.navigationController pushViewController:[MealsViewController new] animated:YES];
            break;
        case 1:
            [self.navigationController pushViewController:[CardiacViewController new] animated:YES];
            break;
        case 2:
            [self.navigationController pushViewController:[WorkoutViewController new] animated:YES];
            break;
        case 3:
            [self.navigationController pushViewController:[MoodViewController new] animated:YES];
            break;
            
        default:
            break;
    }
}

@end

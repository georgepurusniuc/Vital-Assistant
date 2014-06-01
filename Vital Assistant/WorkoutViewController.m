//
//  WorkoutViewController.m
//  Vital Assistant
//
//  Created by George Purusniuc on 01/06/14.
//  Copyright (c) 2014 George Purusniuc. All rights reserved.
//

#import "WorkoutViewController.h"

@interface WorkoutViewController ()
- (IBAction)didTapGetWorkouts:(id)sender;
- (IBAction)didTapDeleteWorkout:(id)sender;
- (IBAction)didTapPostWorkout:(id)sender;

@end

@implementation WorkoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (IBAction)didTapGetWorkouts:(id)sender {
    [self getWorkouts];
}

- (IBAction)didTapDeleteWorkout:(id)sender {
    [self deleteWorkout];
}

- (IBAction)didTapPostWorkout:(id)sender {
    [self postWorkout];
}


- (void)getWorkouts
{
	[UPWorkoutAPI getWorkoutsWithLimit:14 completion:^(NSArray *results, UPURLResponse *response, NSError *error) {
		[self showResults:results];
	}];
}

- (void)postWorkout
{
	NSDate *start = [NSDate dateWithTimeIntervalSince1970:[[NSDate date] timeIntervalSince1970] - (60 * 30)];
	NSDate *end = [NSDate date];
	
	UPWorkout *workout = [UPWorkout workoutWithType:UPWorkoutTypeRun startTime:start endTime:end intensity:UPWorkoutIntensityIntermediate caloriesBurned:@(250)];
	workout.distance = @(7);
	workout.imageURL = @"http://jaredsurnamer.files.wordpress.com/2011/11/116223-magic-marker-icon-sports-hobbies-people-man-runner.png";
	
	[UPWorkoutAPI postWorkout:workout completion:^(UPWorkout *workout, UPURLResponse *response, NSError *error) {
		[self showResults:workout];
	}];
}

- (void)deleteWorkout
{
	[UPWorkoutAPI getWorkoutsWithLimit:1 completion:^(NSArray *results, UPURLResponse *response, NSError *error) {
		if (results.count > 0)
		{
			[UPWorkoutAPI deleteWorkout:results[0] completion:^(id result, UPURLResponse *response, NSError *error) {
				[self showResults:response.metadata];
			}];
		}
	}];
}

@end

//
//  MoodViewController.m
//  Vital Assistant
//
//  Created by George Purusniuc on 01/06/14.
//  Copyright (c) 2014 George Purusniuc. All rights reserved.
//

#import "MoodViewController.h"

@interface MoodViewController ()
- (IBAction)didTapGetMoods:(id)sender;
- (IBAction)didTapDeleteMood:(id)sender;

- (IBAction)didTapPostWakeupMood:(id)sender;
- (IBAction)didTapPostSleepyMood:(id)sender;
- (IBAction)didTapPostSadMood:(id)sender;

@end

@implementation MoodViewController


- (void)viewDidLoad {
    [super viewDidLoad];
}


- (IBAction)didTapGetMoods:(id)sender {
    [UPMoodAPI getCurrentMoodWithCompletion:^(UPMood *mood, UPURLResponse *response, NSError *error) {
		[self showResults:mood];
	}];
}

- (void)postMood:(NSString *)mood {
    UPMood *newMood = [UPMood moodWithType:UPMoodTypePumpedUp title:mood];
	[UPMoodAPI postMood:newMood completion:^(UPMood *mood, UPURLResponse *response, NSError *error) {
		[self showResults:mood];
	}];
}


- (IBAction)didTapPostWakeupMood:(id)sender {
    [self postMood:@"Wakeup"];
}

- (IBAction)didTapPostSleepyMood:(id)sender {
    [self postMood:@"Sleepy"];
}

- (IBAction)didTapPostSadMood:(id)sender {
    [self postMood:@"Sad"];
}

- (IBAction)didTapDeleteMood:(id)sender {
    [UPMoodAPI getCurrentMoodWithCompletion:^(UPMood *mood, UPURLResponse *response, NSError *error) {
		if (mood != nil)
		{
			[UPMoodAPI deleteMood:mood completion:^(id result, UPURLResponse *response, NSError *error) {
				[self showResults:response.metadata];
			}];
		}
	}];
}


@end

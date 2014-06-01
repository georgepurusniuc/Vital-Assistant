//
//  CardiacViewController.m
//  Vital Assistant
//
//  Created by George Purusniuc on 01/06/14.
//  Copyright (c) 2014 George Purusniuc. All rights reserved.
//

#import "CardiacViewController.h"

@interface CardiacViewController ()
- (IBAction)didTapGetCardiaticButton:(id)sender;
- (IBAction)didTapDeleteCardiaticButton:(id)sender;
- (IBAction)didTapPostCardiaticButton:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *cardiaticTextField;

@end

@implementation CardiacViewController


- (void)viewDidLoad {
    [super viewDidLoad];
}


- (IBAction)didTapGetCardiaticButton:(id)sender {
    [self getCardiacEvents];
}

- (IBAction)didTapDeleteCardiaticButton:(id)sender {
    [self deleteCardiacEvent];
}

- (IBAction)didTapPostCardiaticButton:(id)sender {
    [self postCardiacEvent];
}

- (void)postCardiacEvent
{
    if (self.cardiaticTextField.text.length == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"Please add the Heart rate"
                                                       delegate:nil
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil];
        [alert show];
        return;
    }
    NSString * heartRate = self.cardiaticTextField.text;
    int hr = [heartRate intValue];
	UPCardiacEvent *newEvent = [UPCardiacEvent eventWithTitle:@"Heart Stuff" heartRate:@(hr) systolicPressure:@(50) diastolicPressure:@(70) note:@"Just testing" imageURL:@"http://eofdreams.com/data_images/dreams/heart/heart-03.jpg"];
	[UPCardiacEventAPI postCardiacEvent:newEvent completion:^(UPCardiacEvent *event, UPURLResponse *response, NSError *error) {
		[self showResults:event];
	}];
}

- (void)getCardiacEvents
{
	[UPCardiacEventAPI getCardiacEventsWithCompletion:^(NSArray *events, UPURLResponse *response, NSError *error) {
		[self showResults:events];
	}];
}

- (void)deleteCardiacEvent
{
	[UPCardiacEventAPI getCardiacEventsWithCompletion:^(NSArray *events, UPURLResponse *response, NSError *error) {
		if (events.count > 0)
		{
			[UPCardiacEventAPI deleteCardiacEvent:events[0] completion:^(id result, UPURLResponse *response, NSError *error) {
				[self showResults:response.metadata];
			}];
		}
	}];
}



@end

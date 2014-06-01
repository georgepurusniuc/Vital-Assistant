//
//  ResultsViewController.m
//  Vital Assistant
//
//  Created by George Purusniuc on 01/06/14.
//  Copyright (c) 2014 George Purusniuc. All rights reserved.
//

#import "ResultsViewController.h"

@interface ResultsViewController ()


@end

@implementation ResultsViewController

+ (instancetype)createWithResultText:(NSString *)resultString {
    ResultsViewController *instance = [self new];
    instance.resultString = resultString;
    
    return instance;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.textView.text = self.resultString;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

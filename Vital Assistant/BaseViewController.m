//
//  BaseViewController.m
//  Vital Assistant
//
//  Created by George Purusniuc on 01/06/14.
//  Copyright (c) 2014 George Purusniuc. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController


- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)showResults:(id)resultObject
{
	ResultsViewController *resultVC = [ResultsViewController createWithResultText:[NSString stringWithFormat:@"%@", resultObject]];
	[self.navigationController pushViewController:resultVC animated:YES];
}


@end

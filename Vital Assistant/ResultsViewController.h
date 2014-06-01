//
//  ResultsViewController.h
//  Vital Assistant
//
//  Created by George Purusniuc on 01/06/14.
//  Copyright (c) 2014 George Purusniuc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) NSString *resultString;

+ (instancetype)createWithResultText:(NSString *)resultString;

@end

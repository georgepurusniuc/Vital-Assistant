//
//  MealsViewController.m
//  Vital Assistant
//
//  Created by George Purusniuc on 01/06/14.
//  Copyright (c) 2014 George Purusniuc. All rights reserved.
//

#import "MealsViewController.h"

@interface MealsViewController ()
- (IBAction)didTapGetMeals:(id)sender;
- (IBAction)didTapDeleteMeals:(id)sender;
- (IBAction)didTapPostMeals:(id)sender;

@end

@implementation MealsViewController


- (void)viewDidLoad {
    [super viewDidLoad];
}


- (IBAction)didTapGetMeals:(id)sender {
    [self getMeals];
}

- (IBAction)didTapDeleteMeals:(id)sender {
    [self deleteMeal];
}

- (IBAction)didTapPostMeals:(id)sender {
    [self postMeal];
}

- (void)getMeals
{
	[UPMealAPI getMealsWithLimit:5 completion:^(NSArray *results, UPURLResponse *response, NSError *error) {
		[self showResults:results];
	}];
}

- (void)postMeal
{
	UPMealNutritionInfo *info = [[UPMealNutritionInfo alloc] init];
	info.calories = @(130);
	info.sugar = @(30);
	info.carbohydrates = @(10);
	info.calcium = @(80);
	
	UPMealItem *item = [UPMealItem mealItemWithName:@"Granola Bar" description:@"A fancy granola bar." amount:@(1) measurementUnits:@"bar" servingType:UPMealItemServingTypePlate foodType:UPMealItemFoodTypeBrand nutritionInfo:info];
    UPMeal *meal = [UPMeal mealWithTitle:@"Delicious Granola Bar" note:@"" items:@[ item ]];
	meal.photoURL = @"http://studylogic.net/wp-content/uploads/2013/01/burger.jpg";
	
	[UPMealAPI postMeal:meal completion:^(UPMeal *meal, UPURLResponse *response, NSError *error) {
		[self showResults:meal];
	}];
}


- (void)deleteMeal
{
	[UPMealAPI getMealsWithLimit:1 completion:^(NSArray *results, UPURLResponse *response, NSError *error) {
		if (results.count > 0)
		{
			[UPMealAPI deleteMeal:results[0] completion:^(id result, UPURLResponse *response, NSError *error) {
				[self showResults:response.metadata];
			}];
		}
	}];
}

@end

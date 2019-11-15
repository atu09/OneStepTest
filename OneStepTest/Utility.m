//
//  Utility.m
//  OneStepTest
//
//  Created by Atirek Pothiwala on 15/11/19.
//  Copyright © 2019 OneStep Solutions. All rights reserved.
//

#import "Utility.h"

@implementation Utility

// Returns CAGradientLayer after creating a gradient view
+ (CAGradientLayer*)getGradient {
    UIColor *colorBlue = [UIColor colorWithRed:0.00 green:0.22 blue:0.576 alpha:1.0];
    UIColor *colorGreen = [UIColor colorWithRed:0.00 green:0.624 blue:0.373 alpha:1.0];
    
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.colors = @[(id)colorBlue.CGColor, (id)colorGreen.CGColor];
    gradient.locations = @[@0.0, @1.0];
    gradient.startPoint = CGPointMake(0, 0);
    gradient.endPoint = CGPointMake(0, 1);
    
    return gradient;
}

// Instantiate view controller from unique IDs of UIView controllers
+ (UIViewController *)getVC:(NSString *)identifier {
    return [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier: identifier];
}

@end

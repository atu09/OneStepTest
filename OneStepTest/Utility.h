//
//  Utility.h
//  OneStepTest
//
//  Created by Atirek Pothiwala on 15/11/19.
//  Copyright © 2019 OneStep Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Utility : NSObject
+(CAGradientLayer*)getGradient;
+(UIViewController*)getVC: (NSString*)indentifier;
@end

NS_ASSUME_NONNULL_END

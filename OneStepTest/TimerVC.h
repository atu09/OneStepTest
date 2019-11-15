//
//  ViewController.h
//  OneStepTest
//
//  Created by Georgios Aikaterinakis on 13/02/2018.
//  Copyright © 2018 OneStep Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CircularProgressBarView.h"

@interface TimerVC : UIViewController

// Instance of prorgress bar
@property (weak, nonatomic) IBOutlet CircularProgressBarView *pbView;
// Instance of start button
@property (weak, nonatomic) IBOutlet UIButton *btnStart;
// Instance of reset button
@property (weak, nonatomic) IBOutlet UIButton *btnReset;
// Instance of timer label
@property (weak, nonatomic) IBOutlet UILabel *lblTimer;

@property (nonatomic,assign) float totalSeconds;
@property (nonatomic,assign) float currentSeconds;
// flag, whether the countdown started or not
@property (nonatomic,assign) bool isStarted;
@property (nonatomic,assign) NSTimer *countdownTimer;
@property (nonatomic,assign) CAGradientLayer *gradientLayer;

// Click listener of start button
- (IBAction)startTimer:(id)sender;
// Click listener of reset button
- (IBAction)resetTimer:(id)sender;

// Initial Setup
- (void)initialSetup;
// Checking the status count down and do necessary UI changes
- (void)checkTimer;
// Stop the countdown
- (void)stopTimer;
// To update label and display countdown timer.
- (void)setTimer:(float)seconds;
// Selector method to update progress bar using the countdown timer.
- (void)countdown:(NSTimer *)timer;

@end

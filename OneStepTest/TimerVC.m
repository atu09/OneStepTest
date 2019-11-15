//
//  ViewController.m
//  OneStepTest
//
//  Created by Georgios Aikaterinakis on 13/02/2018.
//  Copyright © 2018 OneStep Solutions. All rights reserved.
//

#import "TimerVC.h"
#import "Utility.h"

@interface TimerVC ()

@end

@implementation TimerVC

float totalSeconds = 10;
float currentSeconds = 0.0;

// flag, whether the countdown started or not
bool isStarted = false;

bool isBlink = false;

NSTimer *countdownTimer, *blinkTimer;;
CAGradientLayer *gradientTimer;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    gradientTimer = [Utility getGradient];
    gradientTimer.frame = self.view.bounds;
    [self.view.layer insertSublayer:gradientTimer atIndex:0];
    
    // Resetting the values for progress bar
    self.pbView.value = currentSeconds;
    self.pbView.maxValue = totalSeconds;
    [self checkTimer];
    
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    // if Orientation changes, it is must to change frame of gradient.
    gradientTimer.frame = self.view.bounds;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

// Start the countdown / Stop the countdoun
- (IBAction)startTimer:(id)sender {
    if (isStarted) {
        [self stopTimer];
    } else {
        isStarted = true;
        
        countdownTimer = [NSTimer scheduledTimerWithTimeInterval:0.01
                                                 target:self
                                               selector:@selector(countdown:)
                                               userInfo:nil
                                                repeats:TRUE];
        [self checkTimer];
    }
}

// Start the blink animation when 0 seconds left
- (void)startBlink {
    blinkTimer = [NSTimer scheduledTimerWithTimeInterval:0.5f
                                                      target:self
                                                    selector:@selector(blink:)
                                                    userInfo:nil
                                                     repeats:TRUE];
}

// Here, blinkTimer is calling this Selector method to update progress bar and time on every single eteration.
- (void)blink: (NSTimer *)timer {
    isBlink = !isBlink;
    [UIView animateWithDuration:0.01 animations:^{
        if (isBlink) {
            [self.lblTimer setTextColor: UIColor.redColor];
        } else {
            [self.lblTimer setTextColor: UIColor.whiteColor];
        }
    }];
}

// Stop the blinking
- (void) stopBlink {
    [blinkTimer invalidate];
    blinkTimer = nil;
    [self.lblTimer setTextColor: UIColor.whiteColor];
    
}

// Checking the status count down and do necessary UI changes
- (void)checkTimer {
    [self.btnReset setEnabled:!isStarted];
    [self.btnStart setEnabled:currentSeconds != 10];
    [self.btnStart setTitle: isStarted ? @"STOP" : @"START" forState: UIControlStateNormal];
}

// Stop the countdown
- (void)stopTimer {
    [countdownTimer invalidate];
    countdownTimer = nil;
    isStarted = false;
    [self checkTimer];
}

// Here, countdownTimer is calling this Selector method to update progress bar and time on every single eteration.
- (void)countdown:(NSTimer *)timer {
    currentSeconds = currentSeconds + timer.timeInterval;
    
    if (currentSeconds > 10) {
        currentSeconds = 10;
        [self stopTimer];
        [self startBlink];
    }
    [UIView animateWithDuration:0.01 animations:^{
        [self setTimer:currentSeconds];
        [self.pbView setValue: currentSeconds];
    }];
}

// Reset the timer.
- (IBAction)resetTimer:(id)sender {
    currentSeconds = 0.0;
    [self stopTimer];
    [self stopBlink];
    
    [UIView animateWithDuration:1.f animations:^{
        [self setTimer:currentSeconds];
        [self.pbView setValue: currentSeconds];
    }];
}

-(void)setTimer: (float) seconds {
    float secondsLeft = totalSeconds - seconds;
    NSString *formatString = @"%.2f";
    if (secondsLeft < 10) {
        formatString = @"0%.2f";
    }
    NSString* textToPresent = [NSString stringWithFormat:formatString, secondsLeft];
    [self.lblTimer setText:textToPresent];
}



@end

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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initialSetup];
    [self checkTimer];
}

-(void)initialSetup {
    // preset the current seconds to zero
    [self setCurrentSeconds:0];
    
    // preset the total seconds to 10
    [self setTotalSeconds:10];
    
    // initializing the gradient layer
    [self setGradientLayer: [Utility getGradient]];
    
    // setting the gradient layer frame with the controller view
    self.gradientLayer.frame = self.view.bounds;
    // add the gradient layer to the controller view for background design
    [self.view.layer insertSublayer:self.gradientLayer atIndex:0];
    
    // Preset the values for progress bar
    self.pbView.value = self.currentSeconds;
    self.pbView.maxValue = self.totalSeconds;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    // if Orientation changes, frame of gradient layer should also be updated.
    self.gradientLayer.frame = self.view.bounds;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

// Start the countdown / Stop the countdoun
- (IBAction)startTimer:(id)sender {
    if (self.isStarted) {
        [self stopTimer];
    } else {
        [self setIsStarted:true];
        
        [self setCountdownTimer: [NSTimer scheduledTimerWithTimeInterval:0.01
                                                                  target:self
                                                                selector:@selector(countdown:)
                                                                userInfo:nil
                                                                 repeats:true]];
        [self checkTimer];
    }
}

// Checking the status count down and do necessary UI changes
- (void)checkTimer {
    [self.btnReset setEnabled:!self.isStarted];
    [self.btnStart setEnabled:self.currentSeconds != self.totalSeconds];
    [self.btnStart setTitle: self.isStarted ? @"STOP" : @"START" forState: UIControlStateNormal];
    if (self.currentSeconds >= self.totalSeconds) {
        [self.lblTimer setTextColor: UIColor.redColor];
    } else {
        [self.lblTimer setTextColor: UIColor.whiteColor];
    }
}

// Stop the countdown
- (void)stopTimer {
    [self.countdownTimer invalidate];
    [self setCountdownTimer:nil];
    [self setIsStarted:false];
    [self checkTimer];
}

// CountdownTimer is calling this Selector method to update progress bar and time on every single eteration.
- (void)countdown:(NSTimer *)timer {
    [self setCurrentSeconds: self.currentSeconds + timer.timeInterval];
    if (self.currentSeconds > self.totalSeconds) {
        [self setCurrentSeconds: self.totalSeconds];
        [self stopTimer];
    }
    [UIView animateWithDuration:0.01 animations:^{
        [self setTimer: self.currentSeconds];
        [self.pbView setValue: self.currentSeconds];
    }];
}

// Reset the timer.
- (IBAction)resetTimer:(id)sender {
    // reset the current seconds to 0
    [self setCurrentSeconds:0.0];
    // stop the countdown
    [self stopTimer];
    
    // animating the progress bar to reset the position
    [UIView animateWithDuration:1.f animations:^{
        [self setTimer: self.currentSeconds];
        [self.pbView setValue: self.currentSeconds];
    }];
}

// Update label and display countdown timer in XX:XX format
-(void)setTimer: (float) seconds {
    float secondsLeft = self.totalSeconds - seconds;
    
    // converted the secondsLeft float value in string
    NSString *text = [NSString stringWithFormat:@"%.2f", secondsLeft];
    
    // seperated the decimal and non decimal degits
    NSArray *array = [text componentsSeparatedByString: @"."];
    
    long nonDecimal = [array[0] integerValue];
    long decimal = [array[1] integerValue];
    
    // formated into XX:XX
    NSString* textToPresent = [NSString stringWithFormat:@"%02d:%02d", (int)nonDecimal, (int)decimal];
    [self.lblTimer setText:textToPresent];
}



@end

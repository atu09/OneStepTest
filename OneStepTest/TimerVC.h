//
//  ViewController.h
//  OneStepTest
//
//  Created by Georgios Aikaterinakis on 13/02/2018.
//  Copyright © 2018 OneStep Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MBCircularProgressBar/MBCircularProgressBarView.h>

@interface TimerVC : UIViewController

@property (weak, nonatomic) IBOutlet MBCircularProgressBarView *pbView;
@property (weak, nonatomic) IBOutlet UIButton *btnStart;
@property (weak, nonatomic) IBOutlet UIButton *btnReset;
@property (weak, nonatomic) IBOutlet UILabel *lblTimer;

- (IBAction)startTimer:(id)sender;
- (IBAction)resetTimer:(id)sender;

@end

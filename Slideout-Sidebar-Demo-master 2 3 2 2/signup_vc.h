//
//  signup_vc.h
//  MyTravelExperienceApp
//
//  Created by jigar on 19/07/15.
//  Copyright (c) 2015 MTE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "SWRevealViewController.h"
#import "aProfilevc.h"
@interface signup_vc : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *aSignupName;
@property (weak, nonatomic) IBOutlet UITextField *aSignupEmail;
@property (weak, nonatomic) IBOutlet UITextField *aSignupPassword;
@property (weak, nonatomic) IBOutlet UITextField *aSignupCity;
@property (weak, nonatomic) IBOutlet UISegmentedControl *aSignupGender;
@property (weak, nonatomic) IBOutlet UIButton *aSignuBbtn;
- (IBAction)signupAct:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UISegmentedControl *aProfileOptionSelection;

@property (weak, nonatomic) IBOutlet UIPickerView *aPickerviewoutlet;
@property (weak, nonatomic) IBOutlet UIView *aPickerviewUI;
- (IBAction)addstateaction:(UIButton *)sender;

@end

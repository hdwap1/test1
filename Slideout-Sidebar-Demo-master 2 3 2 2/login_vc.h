//
//  login_vc.h
//  MyTravelExperienceApp
//
//  Created by jigar on 19/07/15.
//  Copyright (c) 2015 MTE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "SWRevealViewController.h"
@interface login_vc : UIViewController<UINavigationBarDelegate>

@property (weak, nonatomic) IBOutlet UITextField *aLoginName;
@property (weak, nonatomic) IBOutlet UITextField *aLoginPassword;

@property (weak, nonatomic) IBOutlet UIButton *aLoginbtn;
@property (weak, nonatomic) IBOutlet UIButton *aLopinForgotBtn;

@property(strong,nonatomic) UITextField *tf;
@property(strong,nonatomic) UITextField *tf1;
//@property (weak, nonatomic) IBOutlet UIButton *aLogSignUpbtn;
//@property (weak, nonatomic) IBOutlet UIButton *aSkipbtn;

@property (weak, nonatomic) IBOutlet UITextField *aDemoText;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *aLoginActivity;


- (IBAction)loginAct:(UIButton *)sender;



@end

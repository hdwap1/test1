//
//  forgotpass_vc.h
//  MyTravelExperienceApp
//
//  Created by indianic on 20/07/15.
//  Copyright (c) 2015 MTE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>


@interface forgotpass_vc : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *aForgotPasswordEmail;

@property (weak, nonatomic) IBOutlet UIButton *aforgotResetBtn;
@property (weak, nonatomic) IBOutlet UILabel *aSuccessMsg;


- (IBAction)forgotPasswordAct:(UIButton *)sender;

@end

//
//  forgotpass_vc.m
//  MyTravelExperienceApp
//
//  Created by indianic on 20/07/15.
//  Copyright (c) 2015 MTE. All rights reserved.
//

#import "forgotpass_vc.h"

@interface forgotpass_vc ()<UITextFieldDelegate>

@end

@implementation forgotpass_vc

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
[Parse setApplicationId:@"aRdKtgCLpKk9PTOpPgZUHIUutAFDxxOs9vCPIz93" clientKey:@"tAGtNESX10C3fa2sboyMOwO1JMTV9RhMvdyhIjvY"];
    
    self.aForgotPasswordEmail.textColor = [UIColor colorWithRed:0/256.0 green:84/256.0 blue:129/256.0 alpha:1.0];
    self.aForgotPasswordEmail.layer.cornerRadius=7;
    self.aForgotPasswordEmail.font = [UIFont fontWithName:@"Avenir Book" size:15];
    self.aForgotPasswordEmail.backgroundColor=[UIColor whiteColor];
    self.aForgotPasswordEmail.placeholder=@" Enter Your Email Address";
    
    self.aSuccessMsg.hidden=YES;
    self.aForgotPasswordEmail.delegate=self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)forgotPasswordAct:(UIButton *)sender {

 
    [PFUser requestPasswordResetForEmailInBackground:
     self.aForgotPasswordEmail.text
                                               block:^(BOOL succeeded, NSError *error)
     {
        
         if (!succeeded)
         {
             
             UIAlertView *alrt = [[UIAlertView alloc] initWithTitle:@"Email incorrect" message:@"Please check your email" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles: @"Login/Register",nil];
             
             [alrt show];

         }
         else
         {
             self.aSuccessMsg.hidden=NO;
             
         }
         
              }];
    

    
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.aForgotPasswordEmail resignFirstResponder];
    return YES;
}
@end

//
//  login_vc.m
//  MyTravelExperienceApp
//
//  Created by jigar on 19/07/15.
//  Copyright (c) 2015 MTE. All rights reserved.
//

#import "login_vc.h"
#import <QuartzCore/QuartzCore.h>
#import "AppDelegate.h"

@interface login_vc ()<UITextFieldDelegate>

{

//    UITextField *tf;
//    UITextField *tf1;
    

}

@end

@implementation login_vc

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [Parse setApplicationId:@"aRdKtgCLpKk9PTOpPgZUHIUutAFDxxOs9vCPIz93" clientKey:@"tAGtNESX10C3fa2sboyMOwO1JMTV9RhMvdyhIjvY"];

    _aLoginActivity.hidden=YES;
    
    self.navigationController.navigationBar.hidden=FALSE;
    
    self.aLoginName.delegate=self;
    self.aLoginPassword.delegate=self;
    //_aDemoText.delegate=self;
    
    
   // self.aLoginName = [[UITextField alloc] initWithFrame:CGRectMake(16, 160, 276,40)];
    self.aLoginName.textColor = [UIColor colorWithRed:0/256.0 green:84/256.0 blue:129/256.0 alpha:1.0];
    self.aLoginName.layer.cornerRadius=7;
    self.aLoginName.font = [UIFont fontWithName:@"Avenir Book" size:15];
    self.aLoginName.backgroundColor=[UIColor whiteColor];
    self.aLoginName.placeholder=@" Enter User Name";
    
    //second one
  //  self.aLoginPassword = [[UITextField alloc] initWithFrame:CGRectMake(16, 212, 276,40)];
    self.aLoginPassword.textColor = [UIColor colorWithRed:0/256.0 green:84/256.0 blue:129/256.0 alpha:1.0];
    self.aLoginPassword.layer.cornerRadius=7;
    self.aLoginPassword.font = [UIFont fontWithName:@"Avenir Book" size:15];
    self.aLoginPassword.backgroundColor=[UIColor whiteColor];
    self.aLoginPassword.placeholder=@" Enter Password";
    

    [self.view addSubview:self.tf];
    [self.view addSubview:self.tf1];
    


}



-(void)viewWillDisappear:(BOOL)animated

{

     _aLoginActivity.hidden=YES;

    
}



-(void)btnClicked {
   
    UIAlertView *alrt = [[UIAlertView alloc] initWithTitle:@"trgv4t" message:@"t3w" delegate:self cancelButtonTitle:@"cancell" otherButtonTitles: nil];
    
    [alrt show];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *) textField
{
   
    [self.aLoginName resignFirstResponder];
    [self.aLoginPassword resignFirstResponder];
    //[_aDemoText resignFirstResponder];
    return YES;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)loginAct:(UIButton *)sender {
    _aLoginActivity.hidden=NO;
    
    
    
    
    [PFUser logInWithUsernameInBackground:_aLoginName.text password:_aLoginPassword.text
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
                                            
                                            SWRevealViewController *swReveal=[self.storyboard instantiateViewControllerWithIdentifier:@"demo"];
                                            [self presentViewController:swReveal animated:YES completion:nil];
                                        }
                                        else{
                                            UIAlertView *alr=[[UIAlertView alloc]initWithTitle:@"Usearname and password does not match" message:@"Please check your usename and password" delegate:self cancelButtonTitle:@"ok" otherButtonTitles: nil];
                                            [alr show];
                                            _aLoginActivity.hidden=YES;

                                        }
                                    }];
    
}


@end

//
//  resetPassword.h
//  SidebarDemo
//
//  Created by indianic on 12/08/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>
#import "EditProfile.h"

@interface resetPassword : ViewController
@property (weak, nonatomic) IBOutlet UITextField *currentPass;

@property (weak, nonatomic) IBOutlet UITextField *anewPass;


- (IBAction)saveAct:(UIButton *)sender;

@end

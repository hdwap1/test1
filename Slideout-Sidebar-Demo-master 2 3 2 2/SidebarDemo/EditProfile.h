//
//  EditProfile.h
//  SidebarDemo
//
//  Created by indianic on 12/08/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>

@interface EditProfile : ViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *auSerEditName;
@property (weak, nonatomic) IBOutlet UITextField *aUserEditEmail;
@property (weak, nonatomic) IBOutlet UITextField *aUserEditPassword;

@property (weak, nonatomic) IBOutlet UITextField *aUserstate;


- (IBAction)aSaveProfile:(UIButton *)sender;
- (IBAction)editPassBtn:(UIButton *)sender;
- (IBAction)editNameBtn:(UIButton *)sender;
- (IBAction)editEmailBtn:(UIButton *)sender;
- (IBAction)editStateBtn:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UIPickerView *Pickervieweditoutlet;


@end

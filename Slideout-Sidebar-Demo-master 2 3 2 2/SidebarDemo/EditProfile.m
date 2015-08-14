//
//  EditProfile.m
//  SidebarDemo
//
//  Created by indianic on 12/08/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

#import "EditProfile.h"

@interface EditProfile (){

    NSArray *pickerDataedit;
    NSInteger pickerrowedit;
    NSString *Pickerstredit;

    
}

@end

@implementation EditProfile

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Pickerstredit = [[NSString alloc]init];
    
    
    pickerDataedit = @[
                   
                 
                   @"Andaman and Nicobar Islands",
                   @"Andhra Pradesh",
                   @"Arunachal Pradesh",
                   @"Assam",
                   @"Bihar",
                   @"Chandigarh",
                   @"Chhattisgarh",
                   @"Dadra and Nagar Haveli",
                   @"Daman and Diu",
                   @"Delhi",
                   @"Goa",
                   @"Gujarat",
                   @"Haryana",
                   @"Himachal Pradesh",
                   @"Jammu and Kashmir",
                   @"Jharkhand",
                   @"Karnataka",
                   @"Kerala",
                   @"Lakshadweep",
                   @"Madhya Pradesh",
                   @"Maharashtra",
                   @"Manipur",
                   @"Meghalaya",
                   @"Mizoram",
                   @"Nagaland",
                   @"Odisha",
                   @"Puducherry",
                   @"Punjab",
                   @"Rajasthan",
                   @" Sikkim",
                   @"Telangana",
                   @"Tripura",
                   @"Uttar Pradesh",
                   @"Uttarakhand",
                   @"West Bengal"
                   ];
    
    self.Pickervieweditoutlet.dataSource = self;
    self.Pickervieweditoutlet.delegate = self;

    
    // Do any additional setup after loading the view.
    self.auSerEditName.enabled=NO;
//    self.aUserEditCity.enabled=NO;
    self.aUserEditEmail.enabled=NO;
    self.aUserstate.enabled = NO;
    
    PFUser *user=[PFUser currentUser];
    NSLog(@"%@",user);
    self.auSerEditName.text=user.username;
    self.aUserEditEmail.text=user.email;
    self.aUserEditPassword.text=user.password;
 self.aUserstate.text=user[@"State"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)aSaveProfile:(UIButton *)sender {
    
    
    
    
    if([_auSerEditName.text length]>5)
    {
        PFUser *user=[PFUser currentUser];
//        PFUser *user=[PFUser user];
        pickerrowedit = [_Pickervieweditoutlet selectedRowInComponent:0];
        Pickerstredit = [pickerDataedit objectAtIndex:pickerrowedit];
        
        user[@"State"]=Pickerstredit;
        self.aUserstate.text=Pickerstredit;
        [user setObject:self.aUserstate.text forKey:@"State"];
        
        [user setEmail:self.aUserEditEmail.text];
        [user setUsername:self.auSerEditName.text];
        
        
        [user saveInBackground];
    }
    
    else{
    
    
        UIAlertView *usernamealert = [[UIAlertView alloc] initWithTitle:@"Opps !" message:@"Please Check your username.Username should be greater than 5 characters." delegate:self cancelButtonTitle:@"cancel" otherButtonTitles: nil];
        [usernamealert show];
    }
    
    
    
}

- (IBAction)editPassBtn:(UIButton *)sender {
    
    
}

- (IBAction)editNameBtn:(UIButton *)sender {
    self.auSerEditName.enabled=YES;
    
    
}

- (IBAction)editEmailBtn:(UIButton *)sender {
    
    self.aUserEditEmail.enabled=YES;
}

- (IBAction)editStateBtn:(UIButton *)sender {
    
    self.aUserstate.enabled = YES;
    _Pickervieweditoutlet.hidden=NO;
    
    
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return pickerDataedit.count;
}


- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return pickerDataedit[row];
}

@end

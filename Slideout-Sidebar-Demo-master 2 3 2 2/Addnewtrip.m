//
//  Addnewtrip.m
//  SidebarDemo
//
//  Created by indianic on 13/08/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

#import "Addnewtrip.h"
#import "SWRevealViewController.h"

@interface Addnewtrip ()

@end

@implementation Addnewtrip

- (void)viewDidLoad {
    [super viewDidLoad];
    
  [Parse setApplicationId:@"aRdKtgCLpKk9PTOpPgZUHIUutAFDxxOs9vCPIz93" clientKey:@"tAGtNESX10C3fa2sboyMOwO1JMTV9RhMvdyhIjvY"];
    AddTripObj =[[PFObject alloc]initWithClassName:@"Place_By_User"];
    
    

    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.Addtripbarbtn setTarget: self.revealViewController];
        [self.Addtripbarbtn setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }


    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)viewDidAppear:(BOOL)animated

{

    NSMutableArray* stateArray = [[NSMutableArray alloc] init];
    
    // add some sample data
    [stateArray addObject:@"Andaman and Nicobar Islands"];
    [stateArray addObject: @"Andhra Pradesh"];
    [stateArray addObject:@"Arunachal Pradesh"];
    [stateArray addObject:@"Assam"];
    [stateArray addObject:@"Bihar"];
    [stateArray addObject:@"Chandigarh"];
    [stateArray addObject:@"Chhattisgarh"];
    [stateArray addObject:@"Dadra and Nagar Haveli"];
    [stateArray addObject:@"Daman and Diu"];
    [stateArray addObject:@"Delhi"];
    [stateArray addObject:@"Goa"];
    [stateArray addObject:@"Gujarat"];
    [stateArray addObject:@"Haryana"];
    [stateArray addObject:@"Himachal Pradesh"];
    [stateArray addObject:@"Jammu and Kashmir"];
    [stateArray addObject:@"Jharkhand"];
    [stateArray addObject:@"Karnataka"];
    [stateArray addObject:@"Kerala"];
    [stateArray addObject:@"Lakshadweep"];
    [stateArray addObject:@"Madhya Pradesh"];
    [stateArray addObject:@"Maharashtra"];
    [stateArray addObject:@"Manipur"];
    [stateArray addObject:@"Meghalaya"];
    [stateArray addObject:@"Mizoram"];
    [stateArray addObject:@"Nagaland"];
    [stateArray addObject:@"Odisha"];
    [stateArray addObject:@"Puducherry"];
    [stateArray addObject:@"Punjab"];
    [stateArray addObject:@"Rajasthan"];
    [stateArray addObject:@"Sikkim"];
    [stateArray addObject:@"Telangana"];
    [stateArray addObject:@"Tripura"];
    [stateArray addObject:@"Uttar Pradesh"];
    [stateArray addObject:@"Uttarakhand"];
    [stateArray addObject:@"West Bengal"];
    
    // bind yourTextField to DownPicker
    self.downPicker = [[DownPicker alloc] initWithTextField:self.Addtripstate withData:stateArray];

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)Uploadtripbtnaction:(UIButton *)sender {
//    [AddTripObj addObject:self.addTripName.text forKey:@"Place_Name"];
//    
//    [AddTripObj addObject:[PFUser currentUser].objectId forKey:@"Connect_user_id"];
//    NSLog(@"%@",[[PFUser currentUser]objectId]);
//    [AddTripObj saveInBackground];
    if(_addTripName.text!=nil && _Addtripstate.text!=nil && _Addtripcity.text!=nil && _Addtriptextview.text!=nil &&_addTripImage.image!=nil)
    {
        
        
        
        [AddTripObj setObject:[NSString stringWithFormat:@"%@",_addTripName.text] forKey:@"Place_name"];
        [AddTripObj setObject:[NSString stringWithFormat:@"%@",_Addtripstate.text] forKey:@"State"];
        [AddTripObj setObject:[NSString stringWithFormat:@"%@",_Addtripcity.text] forKey:@"City"];
        [AddTripObj setObject:[NSString stringWithFormat:@"%@",_Addtriptextview.text] forKey:@"Description"];
        [AddTripObj setObject:[NSString stringWithFormat:@"%@",[PFUser currentUser].username] forKey:@"Upload_by"];
        [AddTripObj setObject:[NSString stringWithFormat:@"%@",[PFUser currentUser].objectId] forKey:@"Connect_user_id"];
        
        
        
        
        [AddTripObj saveInBackgroundWithBlock:^(BOOL result,NSError *error)
         {
             if(result)
             {
                 NSLog(@"Done");
                 
                 
                 UIStoryboard *aStory=[UIStoryboard storyboardWithName:@"Main2" bundle:nil];
                 AddtripPreview *near=[aStory instantiateViewControllerWithIdentifier:@"addtrippreview"];
                 [self.navigationController pushViewController:near animated:YES];
                 
             }
             else
             {
                 UIAlertView *alrt = [[UIAlertView alloc] initWithTitle:@"Login/Register Required" message:@"Please login/Register to use thi feature" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles: @"Login/Register",nil];
                 
                 [alrt show];     }
         }];
        
    }
    else
    {
        UIAlertView *alrt = [[UIAlertView alloc] initWithTitle:@"Login/Register Required" message:@"Please login/Register to use thi feature" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles: @"Login/Register",nil];
        
        [alrt show];
    }
    
    //    [AddTripObj addObject:self.addTripName.text forKey:@"Place_Name"];
    //
    //    [AddTripObj addObject:[PFUser currentUser].objectId forKey:@"Connect_user_id"];
    //    NSLog(@"%@",[[PFUser currentUser]objectId]);
    //    [AddTripObj saveInBackground];
    
}

- (IBAction)Uploadimagebtnaction:(UIButton *)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:NULL];
    
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    
    
    NSData *imageData = UIImagePNGRepresentation(chosenImage);
    
    
    PFFile *file = [PFFile fileWithName:@"place.png" data:imageData];
    [AddTripObj setObject:file forKey:@"Images"];
    
    [file saveInBackground];
    
    //[userimage saveInBackground];
    // [file saveInBackground];
    // userimage[@"profile_pic"]=file;
    
    
    [file getDataInBackgroundWithBlock:
     ^(NSData *aDt, NSError *error){
         
         self.addTripImage.image=[UIImage imageWithData:aDt];
     }];
    self.addTripImage.image = chosenImage;
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
    
}

    



@end

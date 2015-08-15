//
//  AddtripPreview.m
//  SidebarDemo
//
//  Created by indianic on 15/08/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

#import "AddtripPreview.h"

@interface AddtripPreview ()
{
    PFObject *obj;
}
@end

@implementation AddtripPreview

- (void)viewDidLoad {
    [super viewDidLoad];
     [Parse setApplicationId:@"aRdKtgCLpKk9PTOpPgZUHIUutAFDxxOs9vCPIz93" clientKey:@"tAGtNESX10C3fa2sboyMOwO1JMTV9RhMvdyhIjvY"];
    // Do any additional setup after loading the view.
    NSLog(@"%@",_strObjectId);
     obj.objectId=_strObjectId;
   
    obj=[[PFObject alloc]initWithClassName:@"Place_By_User"];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Place_By_User"];
    [query whereKey:@"objectId" equalTo:_strObjectId];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error)
     {
         if(!error)
         {
//             for (obj in objects) {
//                 obj=[[PFObject alloc]init];
//                 obj.objectId=_strObjectId;
             
             
             self.editName.text=[[objects firstObject]objectForKey:@"Place_name"];
             self.editState.text=[[objects firstObject]objectForKey:@"State"];
             self.editCity.text=[[objects firstObject]objectForKey:@"City"];
             self.editDescription.text=[[objects firstObject]objectForKey:@"Description"];
             //self.editImage.image
             
             PFFile *fileRetrive=[[objects firstObject]objectForKey:@"Images"];
             
             [fileRetrive getDataInBackgroundWithBlock:
              ^(NSData *aDt, NSError *error){
                  
                  self.editImage.image=[UIImage imageWithData:aDt];
              }];

             
             self.editName.enabled=NO;
             self.editState.enabled=NO;
             self.editCity.enabled=NO;
             self.editDescription.editable=NO;
         }
             
     
            // Did not find any UserStats for the current user
        else {
            // Found UserStats
                    }
    }];
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

- (IBAction)editMain:(UIBarButtonItem *)sender {
    self.editName.enabled=YES;
    self.editState.enabled=YES;
    self.editCity.enabled=YES;
    self.editDescription.editable=YES;
    
   

}

- (IBAction)changeImageAct:(UIButton *)sender {
    
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
    [obj setObject:file forKey:@"Images"];
    
    [file saveInBackground];
    
    //[userimage saveInBackground];
    // [file saveInBackground];
    // userimage[@"profile_pic"]=file;
    
    
    [file getDataInBackgroundWithBlock:
     ^(NSData *aDt, NSError *error){
         
         self.editImage.image=[UIImage imageWithData:aDt];
     }];
    self.editImage.image = chosenImage;
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
    
}




- (IBAction)deleteAct:(UIButton *)sender {
    UIStoryboard *aStory=[UIStoryboard storyboardWithName:@"Main2" bundle:nil];
    
    Tripmodule_vc *trip=[aStory instantiateViewControllerWithIdentifier:@"aTripvc"];
    [self.navigationController pushViewController:trip animated:YES];

}

- (IBAction)addTripAct:(UIButton *)sender {
   
    
    [obj setObject:[NSString stringWithFormat:@"%@",_editName.text] forKey:@"Place_name"];
    [obj setObject:[NSString stringWithFormat:@"%@",_editState.text] forKey:@"State"];
    [obj setObject:[NSString stringWithFormat:@"%@",_editCity.text] forKey:@"City"];
    [obj setObject:[NSString stringWithFormat:@"%@",_editDescription.text] forKey:@"Description"];
    [obj saveInBackgroundWithBlock:^(BOOL result,NSError *error)
     {
         if(result)
         {
             NSLog(@"Done");
             UIStoryboard *aStory=[UIStoryboard storyboardWithName:@"Main2" bundle:nil];
             allTripViewController *alltrip=[aStory instantiateViewControllerWithIdentifier:@"allTripViewController"];
             [self.navigationController pushViewController:alltrip animated:YES];
             
                      }
     }];
}
@end

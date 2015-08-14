//
//  aProfilevc.m
//  SidebarDemo
//
//  Created by patel Rahul on 25/07/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

#import "aProfilevc.h"
#import "SidebarTableViewController.h"
#import "SWRevealViewController.h"

@interface aProfilevc ()

@end

@implementation aProfilevc

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [Parse setApplicationId:@"aRdKtgCLpKk9PTOpPgZUHIUutAFDxxOs9vCPIz93" clientKey:@"tAGtNESX10C3fa2sboyMOwO1JMTV9RhMvdyhIjvY"];
    PFUser *user=[PFUser currentUser];
    
    
    self.aProfileusername.text=user.username;
    self.aProfileuserstate.text=user[@"State"];
    PFFile *fileRetrive=[user objectForKey:@"profile_pic"];
    
    [fileRetrive getDataInBackgroundWithBlock:
     ^(NSData *aDt, NSError *error){
         
         self.aUserprofilepic.image=[UIImage imageWithData:aDt];
     }];
        
   

    NSLog(@"%@",user[@"City"]);
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.aProfilevcbarbtn setTarget: self.revealViewController];
        [self.aProfilevcbarbtn setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    if(user)
    {
        _editact.hidden=false;
    }
    
}

-(void)viewWillAppear:(BOOL)animated{

  PFUser *user=[PFUser currentUser];
    self.aProfileusername.text=user.username;
    self.aProfileuserstate.text=user[@"State"];
    PFFile *fileRetrive=[user objectForKey:@"profile_pic"];
    
    [fileRetrive getDataInBackgroundWithBlock:
     ^(NSData *aDt, NSError *error){
         }];
    
    
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 15;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}


// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"profilecell" forIndexPath:indexPath];
    
    // cell.backgroundColor=[UIColor greenColor];
    return cell;
}




//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    return CGSizeMake(50, 50);
//}


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

- (IBAction)aProfilefollowaction:(UIButton *)sender {
    
    
}
- (IBAction)aProfilecontactaction:(UIButton *)sender {
    
    
}
- (IBAction)profileAct:(UIButton *)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:NULL];

}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];

    
    NSData *imageData = UIImagePNGRepresentation(chosenImage);

    PFUser *userimage=[PFUser currentUser];
    PFFile *file = [PFFile fileWithName:@"profile.png" data:imageData];
    [userimage removeObjectForKey:@"profile_pic"];
    [userimage setObject:file forKey:@"profile_pic"];
    [file saveInBackground];
    
    [userimage saveInBackground];
   // [file saveInBackground];
    // userimage[@"profile_pic"]=file;

    
    [file getDataInBackgroundWithBlock:
     ^(NSData *aDt, NSError *error){
         
         self.aUserprofilepic.image=[UIImage imageWithData:aDt];
     }];
    self.aUserprofilepic.image = chosenImage;
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
    
    
    
}

@end

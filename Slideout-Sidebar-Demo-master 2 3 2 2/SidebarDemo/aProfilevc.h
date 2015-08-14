//
//  aProfilevc.h
//  SidebarDemo
//
//  Created by patel Rahul on 25/07/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
@interface aProfilevc : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UIBarButtonItem *aProfilevcbarbtn;
@property (weak, nonatomic) IBOutlet UIImageView *aUserprofilepic;
@property (weak, nonatomic) IBOutlet UICollectionView *aCollectionviewoutlet;

@property (weak, nonatomic) IBOutlet UICollectionView *aProfilecollectionview;

@property (weak, nonatomic) IBOutlet UILabel *aProfileuserstate;
@property (weak, nonatomic) IBOutlet UILabel *aProfileusername;
@property (weak, nonatomic) IBOutlet UIButton *aProfilefollow;
- (IBAction)aProfilefollowaction:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *aProfilecontact;
- (IBAction)aProfilecontactaction:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *editact;
@property (weak, nonatomic) IBOutlet UIButton *aUploadPic;
- (IBAction)profileAct:(UIButton *)sender;

@end

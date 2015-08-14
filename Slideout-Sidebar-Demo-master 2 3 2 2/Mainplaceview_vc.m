//
//  Mainplaceview_vc.m
//  SidebarDemo
//
//  Created by indianic on 05/08/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

#import "Mainplaceview_vc.h"
#import "aSearch_vc.h"
#import "MainViewController.h"
#import "SWRevealViewController.h"



@interface Mainplaceview_vc ()

@end

@implementation Mainplaceview_vc

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.mainviewbarbtn setTarget: self.revealViewController];
        [self.mainviewbarbtn setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    

    
    
      [_Mainviewscroll setContentSize:(CGSizeMake(_Mainviewscroll.frame.size.width,850))];
    
        NSLog(@"%f",_Mainviewscroll.frame.size.height);
    
        _Mainviewscroll.backgroundColor = [UIColor whiteColor];
    
    // Do any additional setup after loading the view.
}


- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    
    return 5;
    
}



- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)maincv cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
  
        aPlaceListCell *cell = [maincv dequeueReusableCellWithReuseIdentifier:@"maincollectionview" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor whiteColor];
        
    
        return cell;
    }
    

    
    //    PFFile *aFile=object[@"Images"];
    //                 [aFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
    //
    //                cell.aPlaceImage.image=[UIImage imageWithData:data];
    //
    //                }];
    
    // NSData *aData=object[@"Images"];
    
    //cell.aPlaceImage.image=[UIImage imageWithData:aData];
    //
    //                PFFile *aFile=object[@"Images"];
    //                [aFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
    //
    //                cell.aPlaceImage.image=[UIImage imageWithData:data];
    //
    //                }];
    
    
    //
    //            NSLog(@"%@",objects);
    //        } else {
    //            // Log details of the failure
    //            NSLog(@"Error: %@ %@", error, [error userInfo]);
    //        }
    //    }];
    //
    
    
    

- (CGSize)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
   return CGSizeMake(145, 145);  // will be w120xh100 or w190x100
 
    // if the width is higher, only one image will be shown in a line
}




#pragma mark collection view cell paddings
- (UIEdgeInsets)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    {
        return UIEdgeInsetsMake(5, 10, 5, 10); // top, left, bottom, right
    }
    
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    
    return 5.0;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)mainviewbarbtnaction:(UIBarButtonItem *)sender {
    
    
}
@end

//
//  Mainplaceview_vc.h
//  SidebarDemo
//
//  Created by indianic on 05/08/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Mainplaceview_vc : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *Mainviewscroll;
@property (weak, nonatomic) IBOutlet UICollectionView *mainviewcollection;
@property (weak, nonatomic) IBOutlet UIImageView *mainviewImageview;
@property (weak, nonatomic) IBOutlet UILabel *mainviewname;
@property (weak, nonatomic) IBOutlet UILabel *mainviewcity;
@property (weak, nonatomic) IBOutlet UILabel *maknviewdescription;

@property (weak, nonatomic) IBOutlet UILabel *mainviewlatitude;
@property (weak, nonatomic) IBOutlet UILabel *mainviewlongitude;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *mainviewbarbtn;

- (IBAction)mainviewbarbtnaction:(UIBarButtonItem *)sender;

@end

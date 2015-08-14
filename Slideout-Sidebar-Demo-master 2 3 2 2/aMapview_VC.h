//
//  aMapview_VC.h
//  SidebarDemo
//
//  Created by patel Rahul on 09/08/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

#import "aSearch_vc.h"
#import <MapKit/MapKit.h>
#import <Parse/Parse.h>

@interface aMapview_VC : UIViewController <CLLocationManagerDelegate>

@property (strong,nonatomic) PFObject *array;

@property (weak, nonatomic) IBOutlet UILabel *lat;
@property (weak, nonatomic) IBOutlet UILabel *lonng;
@property (weak, nonatomic) IBOutlet MKMapView *aMapview;
@property(strong,nonatomic) NSString *alat;
@property (strong,nonatomic) NSString *along;


@end

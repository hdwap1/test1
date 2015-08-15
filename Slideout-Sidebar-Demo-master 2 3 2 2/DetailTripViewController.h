//
//  DetailTripViewController.h
//  TravelExperince
//
//  Created by indianic on 03/08/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <MapKit/MapKit.h>

@interface DetailTripViewController : UIViewController <UIScrollViewDelegate>
{
    NSMutableArray *AllData,*mutArrMaster;
    NSString *trip_id;
    NSString *user_id;
    BOOL chk_rate;
    NSString *rateNumber;
}
@property (weak, nonatomic) IBOutlet UIView *Tripviewratingoutlet;
@property (weak, nonatomic) IBOutlet UIScrollView *TripviewScrollview;
@property (weak, nonatomic) IBOutlet UIImageView *tripImg;
@property (nonatomic,strong) NSMutableDictionary *tripnamed;
- (IBAction)rate1:(id)sender;
- (IBAction)rate2:(id)sender;
- (IBAction)rate3:(id)sender;
- (IBAction)rate4:(id)sender;
- (IBAction)rate5:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *r1;
@property (weak, nonatomic) IBOutlet UIButton *r2;
@property (weak, nonatomic) IBOutlet UIButton *r3;
@property (weak, nonatomic) IBOutlet UIButton *r4;
@property (weak, nonatomic) IBOutlet UIButton *r5;
@property (weak, nonatomic) IBOutlet UIImageView *i1;
@property (weak, nonatomic) IBOutlet UILabel *Tripname;
@property (weak, nonatomic) IBOutlet UILabel *Tripcity;
@property (weak, nonatomic) IBOutlet UITextView *TripDescription;
@property (weak, nonatomic) IBOutlet UILabel *Tripstate;

@property (weak, nonatomic) IBOutlet MKMapView *Tripmapview;




@end

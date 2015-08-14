//
//  addTripHome_vc.h
//  MyTravelExperienceApp
//
//  Created by jigar on 20/07/15.
//  Copyright (c) 2015 MTE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface addTripHome_vc : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *aAddNewTripBtn;
@property (weak, nonatomic) IBOutlet UIButton *aLatestTripsBtn;
- (IBAction)AddNewTripAct:(UIButton *)sender;

- (IBAction)LatestTripsAct:(UIButton *)sender;

@end

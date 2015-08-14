//
//  addTripHome_vc.m
//  MyTravelExperienceApp
//
//  Created by jigar on 20/07/15.
//  Copyright (c) 2015 MTE. All rights reserved.
//

#import "addTripHome_vc.h"

@interface addTripHome_vc ()

@end

@implementation addTripHome_vc

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _aAddNewTripBtn.layer.cornerRadius=_aAddNewTripBtn.bounds.size.width/2;
    _aLatestTripsBtn.layer.cornerRadius=_aLatestTripsBtn.bounds.size.width/2;
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

- (IBAction)AddNewTripAct:(UIButton *)sender {
}

- (IBAction)LatestTripsAct:(UIButton *)sender {
}
@end

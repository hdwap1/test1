//
//  aMapview_VC.m
//  SidebarDemo
//
//  Created by patel Rahul on 09/08/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

#import "aMapview_VC.h"
#import "PlaceInfo.h"
#import "aSearch_vc.h"

@interface aMapview_VC ()

{

    CLGeocoder *geos;
    CLLocationManager *aManager;
    

}

@end

@implementation aMapview_VC

- (void)viewDidLoad {
    [super viewDidLoad];
   // self.lat.text=_alat;
    //self.lonng.text=_along;
    NSLog(@"%@",_alat);
    aManager=[[CLLocationManager alloc]init];
    aManager.delegate=self;
    if([aManager respondsToSelector:@selector(requestAlwaysAuthorization)])
    {
        [aManager requestAlwaysAuthorization];
    }
    
    [aManager startUpdatingLocation];
    geos=[[CLGeocoder alloc]init];
    
    
    
    self.lat.text=[NSString stringWithFormat:@"%@",[self.array objectForKey:@"Lattitude"]];
    self.lonng.text=[NSString stringWithFormat:@"%@",[self.array objectForKey:@"Longitude"]];
    

    
    
    CLLocation *locate = [[CLLocation alloc]
                          initWithLatitude:[self.lat.text doubleValue] longitude: [self.lonng.text doubleValue]];
    
    [geos reverseGeocodeLocation:locate completionHandler:^(NSArray *placemarks, NSError *error) {
        CLLocationCoordinate2D coordinate=locate.coordinate;
        MKPointAnnotation *annot = [[MKPointAnnotation alloc] init];
        annot.coordinate=coordinate;
        CLPlacemark *mark=[placemarks objectAtIndex:0];
        
        annot.title = mark.name;
        annot.subtitle = mark.country;
        //        [self.aPlacemap addAnnotation:annot];
        //        [_aPlacemap setCenterCoordinate:coordinate animated:YES];
        
        [_aMapview addAnnotation:annot];
        
        [_aMapview setCenterCoordinate:coordinate animated:YES];
    }];

    
    // Do any additional setup after loading the view.
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


@end

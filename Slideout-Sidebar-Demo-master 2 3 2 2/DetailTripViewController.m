//
//  DetailTripViewController.m
//  TravelExperince
//
//  Created by indianic on 03/08/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import "DetailTripViewController.h"
#import "UIImageView+WebCache.h"

@interface DetailTripViewController ()
{
    NSArray *arry;
}

@end

@implementation DetailTripViewController
@synthesize tripnamed;

- (void)viewDidLoad {
    [super viewDidLoad];
//    PFUser *user1=[PFUser currentUser];
//    NSString *user_id=user1.objectId;
    
    locate=[[CLLocationManager alloc]init];
    locate.delegate=self;
    if([locate respondsToSelector:@selector(requestAlwaysAuthorization)])
    {
        [locate requestAlwaysAuthorization];
    }
    
    [locate startUpdatingLocation];
    geo=[[CLGeocoder alloc]init];

    self.navigationController.navigationBar.hidden=false;
    self.view.backgroundColor = [UIColor colorWithRed:0.710 green:0.710 blue:0.616 alpha:1.000];
    
    _Tripviewratingoutlet.backgroundColor =[UIColor colorWithRed:0.710 green:0.710 blue:0.616 alpha:1.000];
    
    
    _TripviewScrollview.backgroundColor = [UIColor colorWithWhite:0.902 alpha:1.000];
    
    [_TripviewScrollview setContentSize:(CGSizeMake(_TripviewScrollview.frame.size.width,980))];
    
    _TripviewScrollview.backgroundColor = [UIColor colorWithRed:0.710 green:0.710 blue:0.616 alpha:1.000];
    
   
    //trip_id=tripnamed[@"tripid"];

  
   // _username.text=tripnamed[@"un"];
    
//    PFFile *imageFile=[tripnamed objectForKey:@"pimg"];
//    [_tripImg sd_setImageWithURL:[NSURL URLWithString:imageFile.url] placeholderImage:[UIImage imageNamed:@"search.png"]];
//    
//   
//    if (!chk_rate) {
//        //update query
//        NSLog(@"display rating");
//        
//        PFUser *user1=[PFUser currentUser];
//        user_id=user1.objectId;
//        
//        PFQuery *query = [PFQuery queryWithClassName:@"rating"];
//        [query whereKey:@"trip_id" equalTo:trip_id];
//        [query whereKey:@"rating_userId" equalTo:user_id];
//        
//        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error){
//            for (PFObject *object in objects)
//            {
//                NSLog(@"rating trip object id :-%@",object.objectId);
//               
//                 NSString *rateno=[[objects objectAtIndex:0] objectForKey:@"rate_Number"];
//                
//                switch ([rateno intValue]) {
//                    case 1:
//                        _r1.selected=YES;
//                         chk_rate=YES;
//                        break;
//                    case 2:
//                        _r1.selected=YES;
//                        _r2.selected=YES;
//                         chk_rate=YES;
//                        break;
//                    case 3:
//                        _r1.selected=YES;
//                        _r2.selected=YES;
//                        _r3.selected=YES;
//                         chk_rate=YES;
//                        break;
//                    case 4:
//                        _r1.selected=YES;
//                        _r2.selected=YES;
//                         _r3.selected=YES;
//                         _r4.selected=YES;
//                         chk_rate=YES;
//                        break;
//                    case 5:
//                        _r1.selected=YES;
//                        _r2.selected=YES;
//                        _r3.selected=YES;
//                        _r4.selected=YES;
//                        _r5.selected=YES;
//                         chk_rate=YES;
//                        break;
//                }
//                
//            }
//            
//        }];
//    }
//
    
    NSLog(@"%@",_DetailArry);
    
    self.Tripname.text=[_DetailArry objectForKey:@"Place_name"];
    self.Tripstate.text=[_DetailArry objectForKey:@"State"];
    self.Tripcity.text=[_DetailArry objectForKey:@"City"];
    self.TripDescription.text=[_DetailArry objectForKey:@"Description"];
    
    PFFile *fileRetrive=[_DetailArry objectForKey:@"Images"];
    
    [fileRetrive getDataInBackgroundWithBlock:
     ^(NSData *aDt, NSError *error){
         
         self.tripImg.image=[UIImage imageWithData:aDt];
     }];
    

    
    [geo geocodeAddressString:self.Tripcity.text completionHandler:^(NSArray *placemarks, NSError *error) {
        
        
        CLPlacemark *placemark = [placemarks objectAtIndex:0];
        
        
        
        CLLocation *location = placemark.location;
        
        
        
        CLLocationCoordinate2D coordinate = location.coordinate;
        MKPointAnnotation *annot = [[MKPointAnnotation alloc] init];
        annot.coordinate=coordinate;
        annot.title = placemark.name;
        annot.subtitle = placemark.country;
        [self.Tripmapview addAnnotation:annot];
        [_Tripmapview setCenterCoordinate:coordinate animated:YES];
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

- (IBAction)rate1:(id)sender {
    UIButton *button = sender;
    if (button.selected) {
        NSLog(@"not select");
       
        button.selected=NO;
        _r2.selected=NO;
        _r3.selected=NO;
        _r4.selected=NO;
        _r5.selected=NO;
        
        rateNumber=@"0";
        [self ratingUpdate];
        //[self dropRatingTrip];
    }
    else
    {
        
        NSLog(@"is select");
       button.selected=YES;
        
        PFUser *user1=[PFUser currentUser];
        user_id=user1.objectId;
        
        if (chk_rate) {
            //update query
            NSLog(@"update");
            rateNumber=@"1";
            [self ratingUpdate];
        }
        else
        {
            _r1.selected=YES;
            rateNumber=@"1";
            [self firstTimeRating];
        }
    }
}

- (IBAction)rate2:(id)sender {
    UIButton *button = sender;
    if (button.selected) {
        NSLog(@"not");
        button.selected=NO;
        _r3.selected=NO;
        _r4.selected=NO;
        _r5.selected=NO;
        rateNumber=@"1";
        [self ratingUpdate];
    }
    else
    {
        NSLog(@"select");
        button.selected=YES;
        
        PFUser *user1=[PFUser currentUser];
        user_id=user1.objectId;
        
        if (chk_rate) {
            //update query
            NSLog(@"update");
              rateNumber=@"2";
            [self ratingUpdate];
        }
        else
        {
            _r1.selected=YES;
            rateNumber=@"2";
            [self firstTimeRating];
        }
    }
}




- (IBAction)rate3:(id)sender {
    UIButton *button = sender;
    if (button.selected) {
        NSLog(@"is selec");
        button.selected=NO;
        _r4.selected=NO;
        _r5.selected=NO;
        rateNumber=@"2";
        [self ratingUpdate];
    }
    else
    {
        NSLog(@"not select");
        button.selected=YES;
        _r1.selected=YES;
        _r2.selected=YES;
        
        PFUser *user1=[PFUser currentUser];
        user_id=user1.objectId;
        
        if (chk_rate) {
            //update query
            NSLog(@"update");
            rateNumber=@"3";
            [self ratingUpdate];
        }
        else
        {
            _r1.selected=YES;
            rateNumber=@"3";
            [self firstTimeRating];
        }
        
    }
}

- (IBAction)rate4:(id)sender {
    UIButton *button = sender;
    if (button.selected) {
        NSLog(@"is selec");
        button.selected=NO;
        _r5.selected=NO;
        rateNumber=@"3";
        [self ratingUpdate];
    }
    else
    {
        NSLog(@"not select");
        button.selected=YES;
        _r1.selected=YES;
        _r2.selected=YES;
        _r3.selected=YES;
        
        PFUser *user1=[PFUser currentUser];
        user_id=user1.objectId;
        
        if (chk_rate) {
            //update query
            NSLog(@"update");
            rateNumber=@"4";
            [self ratingUpdate];
        }
        else
        {
            _r1.selected=YES;
            rateNumber=@"4";
            [self firstTimeRating];
        }
    }

}

- (IBAction)rate5:(id)sender {
    UIButton *button = sender;
    if (button.selected) {
        NSLog(@"is selec");
        button.selected=NO;
        
        rateNumber=@"4";
        [self ratingUpdate];
    }
    else
    {
        NSLog(@"not select");
        button.selected=YES;
        _r1.selected=YES;
        _r2.selected=YES;
        _r3.selected=YES;
        _r4.selected=YES;
        
        PFUser *user1=[PFUser currentUser];
        user_id=user1.objectId;
        
        if (chk_rate) {
            //update query
            NSLog(@"update");
            rateNumber=@"5";
            [self ratingUpdate];
        }
        else
        {
            _r1.selected=YES;
            rateNumber=@"5";
            [self firstTimeRating];
        }
    }

}

-(void)firstTimeRating
{
    PFObject *pfobj1=[PFObject objectWithClassName:@"rating"];
    [pfobj1 setObject:trip_id forKey:@"trip_id"];
    [pfobj1 setObject:user_id forKey:@"rating_userId"];
    [pfobj1 setObject:rateNumber forKey:@"rate_Number"];
    
    [pfobj1 saveInBackground];
    chk_rate=YES;
}

-(void)ratingUpdate
{
    PFQuery *query = [PFQuery queryWithClassName:@"rating"];
    
    [query whereKey:@"trip_id" equalTo:trip_id];
    [query whereKey:@"rating_userId" equalTo:user_id];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error){
        for (PFObject *object in objects)
        {
            NSLog(@"rating trip object id :-%@",object.objectId);
            PFQuery *query = [PFQuery queryWithClassName:@"rating"];
            
            // Retrieve the object by id
            [query getObjectInBackgroundWithId:object.objectId block:^(PFObject *pfObj, NSError *error) {
                // Update Here
                [pfObj setObject:rateNumber forKey:@"rate_Number"];
                [pfObj saveInBackground];
                
                NSLog(@"update rating");
                
            }];
        }
    }];
}

-(void)dropRatingTrip
{
    PFQuery *query = [PFQuery queryWithClassName:@"rating"];
    [query whereKey:@"trip_id" equalTo:trip_id];
    [query whereKey:@"rate_Number" equalTo:@"0"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
                      // Do something with the found objects
            for (PFObject *object in objects) {
                [object deleteInBackground];
            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}

@end

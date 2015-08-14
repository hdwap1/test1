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

@end

@implementation DetailTripViewController
@synthesize tripnamed;

- (void)viewDidLoad {
    [super viewDidLoad];
//    PFUser *user1=[PFUser currentUser];
//    NSString *user_id=user1.objectId;
    
    
    
    _tripnametext.text= tripnamed[@"tn"];
    _tripcitytext.text=tripnamed[@"tc"];
    _tripcountrytext.text=tripnamed[@"tcc"];
    _tripabouttext.text=tripnamed[@"ap"];
    trip_id=tripnamed[@"tripid"];

    _txttripId.text=tripnamed[@"tripid"];
   // _username.text=tripnamed[@"un"];
    
    PFFile *imageFile=[tripnamed objectForKey:@"pimg"];
    [_tripImg sd_setImageWithURL:[NSURL URLWithString:imageFile.url] placeholderImage:[UIImage imageNamed:@"search.png"]];
    
   
    if (!chk_rate) {
        //update query
        NSLog(@"display rating");
        
        PFUser *user1=[PFUser currentUser];
        user_id=user1.objectId;
        
        PFQuery *query = [PFQuery queryWithClassName:@"rating"];
        [query whereKey:@"trip_id" equalTo:trip_id];
        [query whereKey:@"rating_userId" equalTo:user_id];
        
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error){
            for (PFObject *object in objects)
            {
                NSLog(@"rating trip object id :-%@",object.objectId);
               
                 NSString *rateno=[[objects objectAtIndex:0] objectForKey:@"rate_Number"];
                
                switch ([rateno intValue]) {
                    case 1:
                        _r1.selected=YES;
                         chk_rate=YES;
                        break;
                    case 2:
                        _r1.selected=YES;
                        _r2.selected=YES;
                         chk_rate=YES;
                        break;
                    case 3:
                        _r1.selected=YES;
                        _r2.selected=YES;
                        _r3.selected=YES;
                         chk_rate=YES;
                        break;
                    case 4:
                        _r1.selected=YES;
                        _r2.selected=YES;
                         _r3.selected=YES;
                         _r4.selected=YES;
                         chk_rate=YES;
                        break;
                    case 5:
                        _r1.selected=YES;
                        _r2.selected=YES;
                        _r3.selected=YES;
                        _r4.selected=YES;
                        _r5.selected=YES;
                         chk_rate=YES;
                        break;
                }
                
            }
            
        }];
    }
   
    
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

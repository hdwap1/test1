//
//  allTripViewController.h
//  TravelExperince
//
//  Created by indianic on 11/08/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "FeedTableCellTableViewCell.h"
#import "DetailTripViewController.h"


@interface allTripViewController : UIViewController
{
    NSMutableArray *AllData,*mutArrMaster;
    UIImage *displayImg;
    NSArray *AllFeedPlace;
    NSArray *master;
      
}
@property (weak, nonatomic) IBOutlet UITextField *txtsearch;
@property (weak, nonatomic) IBOutlet UITableView *alltrip;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *Alltripbarbtn;

@end

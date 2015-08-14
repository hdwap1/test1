//
//  Addnewtrip.h
//  SidebarDemo
//
//  Created by indianic on 13/08/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DownPicker.h"
#import <Parse/Parse.h>

@interface Addnewtrip : UIViewController <UIScrollViewDelegate>
{
    PFObject *AddTripObj;
}

@property (strong, nonatomic) DownPicker *downPicker;
@property (weak, nonatomic) IBOutlet UITextField *Addtripstate;
@property (weak, nonatomic) IBOutlet UITextField *Addtripcity;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *Addtripbarbtn;
- (IBAction)Addtripbarbtnaction:(UIBarButtonItem *)sender;

@property (weak, nonatomic) IBOutlet UILabel *Placenameoutlet;
@property (weak, nonatomic) IBOutlet UILabel *Placestateoutlet;
@property (weak, nonatomic) IBOutlet UILabel *Placecityoutlet;
@property (weak, nonatomic) IBOutlet UILabel *Aboutplaceoutlet;
@property (weak, nonatomic) IBOutlet UITextView *Addtriptextview;
- (IBAction)Uploadtripbtnaction:(UIButton *)sender;

- (IBAction)Uploadimagebtnaction:(UIButton *)sender;
@property (strong,nonatomic)PFObject *obj;
@property (weak, nonatomic) IBOutlet UIImageView *addTripImage;
@property (weak, nonatomic) IBOutlet UITextField *addTripName;


@end

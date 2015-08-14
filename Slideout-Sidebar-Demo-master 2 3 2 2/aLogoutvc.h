//
//  aLogoutvc.h
//  SidebarDemo
//
//  Created by patel Rahul on 25/07/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "aLaunch_vc.h"

@interface aLogoutvc : UIViewController
@property (weak, nonatomic) IBOutlet UIBarButtonItem *aLogoutbarbtn;

- (IBAction)aLogoutAct:(UIButton *)sender;

@end

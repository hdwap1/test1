//
//  Tripmodule_vc.h
//  SidebarDemo
//
//  Created by patel Rahul on 13/08/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Tripmodule_vc : UIViewController
@property (weak, nonatomic) IBOutlet UIBarButtonItem *aTripbarbtn;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *aTripbarbtnaction;
@property (weak, nonatomic) IBOutlet UIButton *Addnewtripbtn;
- (IBAction)Addnewtripaction:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *Tripfeedbtn;
- (IBAction)Tripfeedbtnaction:(UIButton *)sender;

@end

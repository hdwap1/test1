//
//  home_vc.h
//  MyTravelExperienceApp
//
//  Created by jigar on 19/07/15.
//  Copyright (c) 2015 MTE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface home_vc : UIViewController <UISearchBarDelegate>
{
    UITextField *aTextField;
}
@property (weak, nonatomic) IBOutlet UIButton *aHomeSearch;
@property (weak, nonatomic) IBOutlet UIButton *aHomeNearMe;
@property (weak, nonatomic) IBOutlet UIButton *aHomeAddTrip;
- (IBAction)homeSearchAct:(UIBarButtonItem *)sender;

@end

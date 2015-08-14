//
//  aLogoutvc.m
//  SidebarDemo
//
//  Created by patel Rahul on 25/07/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

#import "aLogoutvc.h"
#import "SidebarTableViewController.h"
#import "SWRevealViewController.h"

@interface aLogoutvc ()

@end

@implementation aLogoutvc

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.aLogoutbarbtn setTarget: self.revealViewController];
        [self.aLogoutbarbtn setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
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

- (IBAction)aLogoutAct:(UIButton *)sender {
    //PFUser *user=[PFUser currentUser];
    if([PFUser user])
    {
    [PFUser logOut];
        
        aLaunch_vc *aHome = [self.storyboard instantiateViewControllerWithIdentifier:@"launchvc"];
        
        
//        aLaunch_vc *aHome= [[aLaunch_vc alloc]init];
//        [self.navigationController popToRootViewControllerAnimated:aHome];
        
        
        //[self.storyboard instantiateViewControllerWithIdentifier:@"launchvc"];
    

        [self.navigationController pushViewController:aHome animated:YES];
        
    }
    
}
@end

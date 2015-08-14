//
//  aLaunch_vc.m
//  MyTravelExperienceApp
//
//  Created by patel Rahul on 24/07/15.
//  Copyright (c) 2015 MTE. All rights reserved.
//

#import "aLaunch_vc.h"
#import "MainViewController.h"
#import "AppDelegate.h"

@interface aLaunch_vc ()

@end

@implementation aLaunch_vc

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
    
    self.navigationController.navigationBar.hidden=TRUE;
    if([PFUser currentUser])
    {
        SWRevealViewController *swReveal=[self.storyboard instantiateViewControllerWithIdentifier:@"demo"];
        [self presentViewController:swReveal animated:YES completion:nil];
        
        
    }

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
   }

-(void)viewWillAppear:(BOOL)animated {

self.navigationController.navigationBar.hidden=TRUE;
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)aSkipbtnAct:(UIButton *)sender {
    
    MainViewController *main=[self.storyboard instantiateViewControllerWithIdentifier:@"mainvc"];
    main.navigationController.navigationBar.hidden=NO;
    
    AppDelegate *appDelegate = (AppDelegate*) [UIApplication sharedApplication].delegate;
    
    appDelegate.userstate = TRUE;
    
}

- (IBAction)aLoginAct:(UIButton *)sender {
    AppDelegate *appDelegate = (AppDelegate*) [UIApplication sharedApplication].delegate;
    
    appDelegate.userstate = FALSE;

}

- (IBAction)aNewAccountAct:(UIButton *)sender {
    AppDelegate *appDelegate = (AppDelegate*) [UIApplication sharedApplication].delegate;
    
    appDelegate.userstate = FALSE;

}
@end

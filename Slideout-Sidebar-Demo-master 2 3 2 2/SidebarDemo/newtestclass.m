//
//  newtestclass.m
//  SidebarDemo
//
//  Created by patel Rahul on 25/07/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

#import "newtestclass.h"
#import "SidebarTableViewController.h"
#import "SWRevealViewController.h"
#import "MainViewController.h"



@interface newtestclass ()

@end

@implementation newtestclass

- (IBAction)btntest:(UIButton *)sender {
    

//    NSString * storyboardName = @"Main";
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle: nil];
//    
//    SWRevealViewController *vc1 = [storyboard instantiateViewControllerWithIdentifier:@"demo"];
//    
//    [self presentViewController:vc1 animated:YES completion:nil];
    
    
    //[self performSegueWithIdentifier:@"demo1" sender:nil];
    
    [self performSegueWithIdentifier:@"demo1" sender:self];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

  
    //
//    SWRevealViewController *revealViewController = self.revealViewController;
//    if ( revealViewController )
//    {
//        [self.sidebar setTarget: self.revealViewController];
//        [self.sidebar setAction: @selector( revealToggle: )];
//        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
//    }
//
    
    
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

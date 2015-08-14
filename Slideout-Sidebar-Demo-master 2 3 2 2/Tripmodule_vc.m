//
//  Tripmodule_vc.m
//  SidebarDemo
//
//  Created by patel Rahul on 13/08/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

#import "Tripmodule_vc.h"
#import "SWRevealViewController.h"

@interface Tripmodule_vc ()

@end

@implementation Tripmodule_vc

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 122
    //344
    

    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.aTripbarbtn setTarget: self.revealViewController];
        [self.aTripbarbtn setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }

    
     _Tripfeedbtn.layer.cornerRadius=_Tripfeedbtn.bounds.size.width/2;
     _Addnewtripbtn.layer.cornerRadius=_Addnewtripbtn.bounds.size.width/2;
    
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

- (IBAction)Addnewtripaction:(UIButton *)sender {
}
- (IBAction)Tripfeedbtnaction:(UIButton *)sender {
}
@end

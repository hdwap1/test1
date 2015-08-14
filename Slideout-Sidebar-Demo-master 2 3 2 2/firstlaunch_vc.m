//
//  firstlaunch_vc.m
//  MyTravelExperienceApp
//
//  Created by patel Rahul on 23/07/15.
//  Copyright (c) 2015 MTE. All rights reserved.
//

#import "firstlaunch_vc.h"

@interface firstlaunch_vc ()

{
    UIButton *myButton;
}

@end

@implementation firstlaunch_vc

- (void)viewDidLoad {
    [super viewDidLoad];
    
    myButton = [[UIButton alloc]init];
    
    [myButton setImage:[UIImage imageNamed:@"buttonImage.png"]
              forState: UIControlStateNormal];
    
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

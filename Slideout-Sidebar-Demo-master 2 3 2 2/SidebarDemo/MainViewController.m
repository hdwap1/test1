//
//  MainViewController.m
//  SidebarDemo
//
//  Created by Simon Ng on 10/11/14.
//  Copyright (c) 2014 AppCoda. All rights reserved.
//

#import "MainViewController.h"
#import "SWRevealViewController.h"
#import "addTripHome_vc.h"
#import "aSearch_vc.h"
#import "AppDelegate.h"
#import "Tripmodule_vc.h"

@interface MainViewController ()<UITextFieldDelegate, UIGestureRecognizerDelegate>

{
    
//    UISearchBar *sBar;
    BOOL isSearchEnabled;
}

@end


@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
  self.navigationController.navigationBar.backgroundColor=[UIColor colorWithRed:0.710 green:0.710 blue:0.616 alpha:1.000];
    
    
    //self.view.backgroundColor=[UIColor colorWithRed:0.084 green:0.167 blue:0.249 alpha:1.000];
    
//    UITapGestureRecognizer *tapgesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTapFrom:)];
    
//    [self.view addGestureRecognizer:tapgesture];
    
    // Do any additional setup after loading the view.
    _aSearchtrip.layer.cornerRadius=_aSearchtrip.bounds.size.width/2;
    _aNearme.layer.cornerRadius=_aNearme.bounds.size.width/2;
    _aAddtrip.layer.cornerRadius=_aAddtrip.bounds.size.width/2;
    
    
    //to hide back button
    
  //  self.navigationItem.hidesBackButton=YES;
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }

    
    
//    UIButton *btn  = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
//    [btn setImage:[UIImage imageNamed:@"asearch.png"] forState:UIControlStateNormal];
//    [btn addTarget:self action:@selector(toggleSearchbutton:) forControlEvents:UIControlEventTouchUpInside];
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
}





-(void)reloadData:(UIButton*)sender{
    
    
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



- (IBAction)aAddtrip:(UIButton *)sender {
    AppDelegate *appDelegate = (AppDelegate*) [UIApplication sharedApplication].delegate;
    if(appDelegate.userstate==TRUE)
    {
        UIAlertView *alrt = [[UIAlertView alloc] initWithTitle:@"Login/Register Required" message:@"Please login/Register to use thi feature" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles: @"Login/Register",nil];
        
        [alrt show];
    }
    
        else
            
        {
            UIStoryboard *aStory=[UIStoryboard storyboardWithName:@"Main2" bundle:nil];
            Tripmodule_vc *aTripvc=[aStory instantiateViewControllerWithIdentifier:@"aTripvc"];
            [self.navigationController pushViewController:aTripvc animated:YES];
        }
    
    
    
    

}

- (IBAction)aNearme:(UIButton *)sender {
      AppDelegate *appDelegate = (AppDelegate*) [UIApplication sharedApplication].delegate;
    if(appDelegate.userstate==TRUE)
    {
        UIAlertView *alrt = [[UIAlertView alloc] initWithTitle:@"Login/Register Required" message:@"Please login/Register to use thi feature" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles: @"Login/Register",nil];
        
        [alrt show];
    }
    else
    {
        UIStoryboard *aStory=[UIStoryboard storyboardWithName:@"Main2" bundle:nil];
        Nearmevc *near=[aStory instantiateViewControllerWithIdentifier:@"nearmevc"];
        [self.navigationController pushViewController:near animated:YES];
    }
    
}

- (IBAction)aSearchtrip:(UIButton *)sender {
    
    UIStoryboard *aStory=[UIStoryboard storyboardWithName:@"Main2" bundle:nil];
    aSearch_vc *aSearch=[aStory instantiateViewControllerWithIdentifier:@"asearchtrip"];
    [self.navigationController pushViewController:aSearch animated:YES];

    
    
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex==1)
    {
        aLaunch_vc *aHome=[self.storyboard instantiateViewControllerWithIdentifier:@"launchvc"];
        [self.navigationController pushViewController:aHome animated:YES];
    }
}




@end

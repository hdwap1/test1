//
//  home_vc.m
//  MyTravelExperienceApp
//
//  Created by jigar on 19/07/15.
//  Copyright (c) 2015 MTE. All rights reserved.
//

#import "home_vc.h"
#import <Parse/Parse.h>
@interface home_vc () <UITextFieldDelegate, UIGestureRecognizerDelegate>
{
    UISearchBar *sBar;
}
@end

@implementation home_vc

- (void)viewDidLoad {
    [super viewDidLoad];
     [Parse setApplicationId:@"aRdKtgCLpKk9PTOpPgZUHIUutAFDxxOs9vCPIz93" clientKey:@"tAGtNESX10C3fa2sboyMOwO1JMTV9RhMvdyhIjvY"];
   // [[UINavigationBar appearance] setBarTintColor:[UIColor yellowColor]];
    
    
    UITapGestureRecognizer *tapgesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTapFrom:)];
    
    [self.view addGestureRecognizer:tapgesture];
    
    // Do any additional setup after loading the view.
    _aHomeSearch.layer.cornerRadius=_aHomeSearch.bounds.size.width/2;
    _aHomeNearMe.layer.cornerRadius=_aHomeNearMe.bounds.size.width/2;
    _aHomeAddTrip.layer.cornerRadius=_aHomeAddTrip.bounds.size.width/2;
    
    
  //to hide back button
    
    self.navigationItem.hidesBackButton=YES;
    
    //     aTextField = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, self.navigationController.navigationBar.frame.size.width, 21.0)];
    //    aTextField.delegate=self;
    
    //    [self setImageBackground:@"simple1.jpg"];
    
    sBar =[[UISearchBar alloc]initWithFrame: CGRectMake(10, 10, self.navigationController.navigationBar.bounds.size.width/1.2, self.navigationController.navigationBar.bounds.size.height/2)];
    
}

-(void)handleTapFrom:(UITapGestureRecognizer*)sender{

    
    [sBar removeFromSuperview];
//    self.navigationController.title =@"hvdhjvbds";

    
   
}

//-(void)setImageBackground:(NSString*)imageName{
//    UINavigationController* navigationController = [self navigationController];
//    float height = navigationController.toolbar.frame.size.height;
//    CGSize size = self.view.frame.size;
//    size.height = size.height;
//    UIGraphicsBeginImageContext(size);
//    CGRect bounds = self.view.bounds;
//    bounds.origin.y = bounds.origin.y + height;
//    bounds.size.height = bounds.size.height-height;
//    [[UIImage imageNamed:imageName] drawInRect:bounds];
//    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
//}

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

- (IBAction)homeSearchAct:(UIBarButtonItem *)sender {
    
        
    sBar.hidden=FALSE;
    sBar.delegate = self;
    [self.navigationController.navigationBar addSubview:sBar];
    sBar.autoresizingMask = 0;
    sBar.delegate = self;
    [sBar setPlaceholder:@"Search Places"];
//    self.navigationItem.titleView = sBar;

//    [self.navigationController.navigationBar addSubview:sBar];
}



//
//-(BOOL)textFieldShouldReturn:(UITextField *)textField
//{
//    [aTextField resignFirstResponder];
//    aTextField.hidden=YES;
//    //UILabel *lbl=[[UILabel alloc]init];
//    //lbl.text=@"My Travel Experience";
//    //self.navigationController.navigationItem.titleView=lbl;
//    //lbl.hidden=NO;
//    
//    return YES;
//}
@end

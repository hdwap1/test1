//
//  launch_vc.m
//  MyTravelExperienceApp
//
//  Created by patel Rahul on 23/07/15.
//  Copyright (c) 2015 MTE. All rights reserved.
//

#import "launch_vc.h"

@interface launch_vc ()<UITextFieldDelegate, UIGestureRecognizerDelegate>
{
    UISearchBar *sBar1;
}
@property (weak, nonatomic) IBOutlet UISearchBar *aSearchbox;
@property (weak, nonatomic) IBOutlet UINavigationItem *item1;
@end

@implementation launch_vc

- (void)viewDidLoad {
    [super viewDidLoad];


    
    sBar1 =[[UISearchBar alloc]initWithFrame: CGRectMake(10, 10, self.navigationController.navigationBar.bounds.size.width/1.2, self.navigationController.navigationBar.bounds.size.height/2)];
    
    UITapGestureRecognizer *tapgesture1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTapFrom1:)];
    
    [self.view addGestureRecognizer:tapgesture1];
 _item1.title=@"My Travel Experience";
    
    
    
    // Do any additional setup after loading the view.
}
- (IBAction)searchbtn:(UIBarButtonItem *)sender {
    
    _aSearchbox.hidden=FALSE;
    _item1.title=nil;

    
}


-(void)handleTapFrom1: (UITapGestureRecognizer*)sender{

    _aSearchbox.hidden=TRUE;
    
    [_aSearchbox resignFirstResponder];
    
     _item1.title=@"My Travel Experience";

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

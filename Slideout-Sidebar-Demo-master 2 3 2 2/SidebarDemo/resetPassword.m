//
//  resetPassword.m
//  SidebarDemo
//
//  Created by indianic on 12/08/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

#import "resetPassword.h"

@interface resetPassword ()

@end

@implementation resetPassword

- (void)viewDidLoad {
    [super viewDidLoad];
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

- (IBAction)saveAct:(UIButton *)sender {
    PFUser *user=[PFUser currentUser];
    NSString *current=self.currentPass.text;
    NSString *new=self.anewPass.text;

    [PFUser logInWithUsernameInBackground:user.username password:current block:^(PFUser *user, NSError *error) {
        if(user)
        {
            user.password=new;
            [user saveInBackground];
            EditProfile *edit=[[EditProfile alloc]init];
            [self.navigationController popToViewController: edit animated:YES];
        }
        else
        {
            UIAlertView *alrt = [[UIAlertView alloc] initWithTitle:@"Wrong password" message:@"Enter Current password" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            
            [alrt show];
        }
    }];
    
//    if([current isEqualToString:user.password])
//    {
//        
//        
//    }
//    else
//    {
//        NSLog(@"pass not");
//    }
    
}
@end

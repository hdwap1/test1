//
//  allTripViewController.m
//  TravelExperince
//
//  Created by indianic on 11/08/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import "allTripViewController.h"
#import "DetailTripViewController.h"
#import "UIImageView+WebCache.h"
@interface allTripViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>


@end

@implementation allTripViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    AllData =[[NSMutableArray alloc] init];
    mutArrMaster = [[NSMutableArray alloc] init];
    
    
    self.navigationController.navigationItem.hidesBackButton = YES;
    
    //    hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    //    hud.mode = MBProgressHUDModeIndeterminate;
    //    hud.labelText = @"Please Wait";
    //    [hud show:YES];
    
//    self.viewprogress.hidden=NO;
//    self.viewprogress.layer.cornerRadius=10.0f;
//    
//    
//    
//    [_act startAnimating];
//    
    
    
    PFQuery *query = [PFQuery queryWithClassName:@"AddTrip"];
    //[query whereKey:@"user" containedIn:[NSArray arrayWithObjects:[PFUser currentUser], nil]];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        
        
        
        for (PFObject *object in objects) {
            NSString *trip_id=object.objectId;
           
            
            NSMutableDictionary *CurentRow=[[NSMutableDictionary alloc] init];
            
            //            CurentRow =[[NSMutableDictionary alloc] setValuesForKeysWithDictionary:@{@"obj",@"adf"}];
            [CurentRow setObject:[object objectForKey:@"tripName"] forKey:@"tn"];
            [CurentRow setObject:[object objectForKey:@"tripCountry"] forKey:@"tc"];
            [CurentRow setObject:[object objectForKey:@"tripCity"] forKey:@"tcc"];
            [CurentRow setObject:[object objectForKey:@"aboutPlace"] forKey:@"ap"];
             [CurentRow setObject:trip_id forKey:@"tripid"];
            PFFile *imageFile = [object objectForKey:@"placeImage"];
            [CurentRow setObject:imageFile forKey:@"pimg"];
            
            
            [mutArrMaster addObject:CurentRow];
        }
        
        
    }];
    [self performSelector:@selector(bindDataToArray) withObject:nil afterDelay:3.0];
    // Do any additional setup after loading the view.
}
-(void)bindDataToArray
{
    NSLog(@"%@",mutArrMaster);
    
    AllData = [NSMutableArray arrayWithArray:mutArrMaster];
    //     [hud hide:YES];
   // self.viewprogress.hidden=YES;
    [_alltrip reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return AllData.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Cell1"];
    
    UILabel *text1=(UILabel *)[cell viewWithTag:1];
    text1.text=[[AllData objectAtIndex:indexPath.row] objectForKey:@"tn"];
    [cell addSubview:text1];
    
    UILabel *text2=(UILabel *)[cell viewWithTag:2];
    text2.text=[[AllData objectAtIndex:indexPath.row] objectForKey:@"tc"];
    [cell addSubview:text2];
    
    PFFile *imageFile=[[AllData objectAtIndex:indexPath.row] objectForKey:@"pimg"];
    NSLog(@"%@",imageFile.url);
    
    UIImageView *aImgView = (UIImageView*)[cell viewWithTag:3];
    
    [aImgView sd_setImageWithURL:[NSURL URLWithString:imageFile.url] placeholderImage:[UIImage imageNamed:@"search.png"]];
    
    
    return cell;
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (IBAction)searchbtnclick:(id)sender {
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSString *aStrQuery = [textField.text stringByReplacingCharactersInRange:range withString:string];
    [self updateTableForQuery:aStrQuery];
    
    return YES;
}
-(void)updateTableForQuery:(NSString*)strQuery{
    
    if(!strQuery || strQuery.length==0){
        AllData = mutArrMaster;
        [_alltrip reloadData];
    }else{
        NSPredicate *aPredicate = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
            NSDictionary *aDict = evaluatedObject;
            NSString *aStrTripName = aDict[@"tn"];
            
            if([aStrTripName rangeOfString:strQuery options:NSCaseInsensitiveSearch].location!=NSNotFound){
                return YES;
            }
            return NO;
        }];
        
        NSMutableArray *searchedResule = [mutArrMaster filteredArrayUsingPredicate:aPredicate].mutableCopy;
        AllData =  searchedResule;
        [_alltrip reloadData];
    }
}
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//        //[self performSegueWithIdentifier: @"detailview" sender: self];
////
//}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"detailview"]) {
        DetailTripViewController *destViewController = segue.destinationViewController;
        
        NSIndexPath *indexPath;
        indexPath = [self.alltrip indexPathForSelectedRow];
        
        destViewController.tripnamed=(NSMutableDictionary *)[AllData objectAtIndex:indexPath.row];
        
        
    }
    
}



- (IBAction)LO:(id)sender {
    [PFUser logOut];
    //  LoginViewController *objlview=[self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController1"];
    [self.navigationController popViewControllerAnimated:YES];
    NSLog(@"LogOut Successful.");
    
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

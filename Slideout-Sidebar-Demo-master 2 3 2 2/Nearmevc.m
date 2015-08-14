//
//  Nearmevc.m
//  SidebarDemo
//
//  Created by jigar on 12/08/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

#import "Nearmevc.h"

@interface Nearmevc ()
{
    CLGeocoder *geo;
    
    
    CLLocationManager *aManager;
    
    NSMutableArray *latArry;
    NSMutableArray *longArry;
    
}

@end

@implementation Nearmevc

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:0.710 green:0.710 blue:0.616 alpha:1.000];
    testLatArry=[[NSMutableArray alloc]init];
    
    
    testLongArry=[[NSMutableArray alloc]init];
    testName=[[NSMutableArray alloc]init];
    
    // Do any additional setup after loading the view.
    [Parse setApplicationId:@"aRdKtgCLpKk9PTOpPgZUHIUutAFDxxOs9vCPIz93" clientKey:@"tAGtNESX10C3fa2sboyMOwO1JMTV9RhMvdyhIjvY"];
    latArry=[[NSMutableArray alloc]init];
    longArry=[[NSMutableArray alloc]init];
    PFUser *user=[PFUser currentUser];
    self.aUserState=user[@"State"];
    NSLog(@"%@",self.aUserState);
    PFQuery *aQuery=[[PFQuery alloc]initWithClassName:@"Place_Default"];
    
    [aQuery whereKey:@"State" equalTo:user[@"State"]];
    self.aNearByPlaceHeading.text=[NSString stringWithFormat:@"Near by %@",user[@"State"]];
    
    //    [aQuery setLimit:400];
    //    aQuery.cachePolicy=kPFCachePolicyNetworkElseCache;
    
    [aQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            aNearMePlacesArry=[[NSArray alloc]initWithArray:objects];
            
            if(aNearMePlacesArry.count==0)
            {
                UIAlertView *alrt = [[UIAlertView alloc] initWithTitle:@"No near by places" message:@"Sorry,there is no nearby traveling places around you" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
                
                [alrt show];
                
            }
            //NSLog(@"%@",aNearMePlacesArry);
            // [testLatArry addObjectsFromArray:[[aNea]]]
            
            //  [testLatArry addObject:[[aNearMePlacesArry objectAtIndex:indexPath.row]objectForKey:@"Lattitude"]];
            //  [testLongArry addObject:[[aNearMePlacesArry objectAtIndex:indexPath.row]objectForKey:@"Longitude"]];
            
            
            [self.aNearMeTable reloadData];
            
            //
            for (PFObject *obj in objects) {
                NSLog(@"%@",obj);
                [testLatArry addObject:[obj objectForKey:@"Lattitude"]];
                [testLongArry addObject:[obj objectForKey:@"Longitude"]];
                [testName addObject:[obj objectForKey:@"Name"]];
                if(testLatArry.count==objects.count)
                {
                    [self displaymapAnnotation];
                }
            }
            
        }
        else{
            NSLog(@"error");
        }
    }];
    
    
    //    PFQuery *reportNumber=[PFQuery queryWithClassName:@"Place_Default"];
    //    [reportNumber whereKey:@"State" equalTo:user[@"State"]];
    //    [reportNumber getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error){
    //
    //        [testLatArry addObject:[object objectForKey:@"Lattitude"]];
    //
    //        [testLatArry addObject:[object objectForKey:@"Longitude"]];
    //
    //
    //    }];
    self.aNearMeTable.backgroundColor=self.view.backgroundColor = [UIColor colorWithRed:0.710 green:0.710 blue:0.616 alpha:1.000];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated
{
    
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(aNearMePlacesArry.count>0)
    {
        
        return aNearMePlacesArry.count;
    }
    return 0;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    

    NearMeTable *cell=[tableView dequeueReusableCellWithIdentifier:@"nearme"];
    cell.aNearMeIndex.textColor=[UIColor colorWithRed:220 green:220 blue:203 alpha:1.000];
    cell.aNearMePlaceCity.textColor=[UIColor colorWithRed:220 green:220 blue:203 alpha:1.000];
    cell.aNearMePlaceName.textColor=[UIColor colorWithRed:220 green:220 blue:203 alpha:1.000];
    cell.aNearMePlaceName.text=[[aNearMePlacesArry objectAtIndex:indexPath.row]objectForKey:@"Name"];
    cell.aNearMePlaceCity.text=[[aNearMePlacesArry objectAtIndex:indexPath.row]objectForKey:@"City"];
    cell.aNearMeIndex.text=[NSString stringWithFormat:@"%ld",(long)indexPath.row +1];
    
    cell.backgroundColor= [UIColor colorWithRed:0.710 green:0.710 blue:0.616 alpha:1.000];
    
    
    //    self.strLat=[[aNearMePlacesArry objectAtIndex:indexPath.row]objectForKey:@"Lattitude"];
    //    self.strLong=[[aNearMePlacesArry objectAtIndex:indexPath.row]objectForKey:@"Longitude"];
    //    _arry=[[NSMutableArray alloc]initWithObjects:[[aNearMePlacesArry objectAtIndex:indexPath.row]objectForKey:@"Lattitude"]];
    
    
    
    return cell;
    
    
}
-(void)displaymapAnnotation
{
    //    for (NSInteger i=0; i<testLatArry.count; i++) {
    
    //    NSLog(@"displaymapAnnotation");
    //
    //    CLLocation *locate = [[CLLocation alloc]
    //                          initWithLatitude:[[testLatArry firstObject] doubleValue] longitude: [[testLongArry firstObject] doubleValue]];
    //
    //        if(!geo){
    //            geo = [[CLGeocoder alloc]init];
    //        }
    //    [geo reverseGeocodeLocation:locate completionHandler:^(NSArray *placemarks, NSError *error) {
    //
    //        CLLocationCoordinate2D coordinate=locate.coordinate;
    //        MKPointAnnotation *annot = [[MKPointAnnotation alloc] init];
    //        annot.coordinate=coordinate;
    //        CLPlacemark *mark=[placemarks objectAtIndex:0];
    //
    //        annot.title = mark.name;
    //        annot.subtitle = mark.country;
    //
    //
    //        //[_aPlaceMap addAnnotation:annot];
    //        //[_aPlaceMap addAnnotations:<#(NSArray *)#>];
    //
    //
    //        [_aPlaceMap setCenterCoordinate:coordinate animated:YES];
    //
    //
    ////        [testLatArry removeObjectAtIndex:i];
    ////        [testLongArry removeObjectAtIndex:i];
    //            }];
    //        [testLatArry removeObjectAtIndex:0];
    //        [testLongArry removeObjectAtIndex:0];
    ////        [testLongArry removeAllObjects];
    //
    //
    
    NSMutableArray* annotations = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < testLatArry.count; i++)
    {
        
        MKPointAnnotation* marker = [[MKPointAnnotation alloc] init];
        
        CLLocationCoordinate2D Newcoordinate;
        Newcoordinate.latitude=[[testLatArry objectAtIndex:i]doubleValue];
        Newcoordinate.longitude=[[testLongArry objectAtIndex:i]doubleValue];
        
        marker.coordinate=Newcoordinate;
        marker.title=[testName objectAtIndex:i];
        //marker.coordinate.latitude=
        [annotations addObject:marker];
        //MKCoordinateSpan span = MKCoordinateSpanMake(30.59f,0.0001f);
        //MKCoordinateRegion region = {Newcoordinate, span};
        //MKCoordinateRegion regionThatFits = [self.aPlaceMap regionThatFits:region];
        MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(Newcoordinate, 30000, 30000);
        MKCoordinateRegion adjustedRegion = [self.aPlaceMap regionThatFits:viewRegion];
        [self.aPlaceMap setRegion:adjustedRegion animated:YES];
        //[self.aPlaceMap setRegion:regionThatFits animated:YES];
        
    }
    
    [_aPlaceMap addAnnotations:annotations];
    //[_aPlaceMap setr]
    
    
    
}
//-(void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//
//
//        [self displaymapAnnotation];
//
//}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *aStory=[UIStoryboard storyboardWithName:@"Main2" bundle:nil];
    
    PlaceInfo *placeDetail=[aStory instantiateViewControllerWithIdentifier:@"placeinfo"];
    
    placeDetail.array=[aNearMePlacesArry objectAtIndex:indexPath.row];
    
    //    aMapview_VC *mapviews=[aStory instantiateViewControllerWithIdentifier:@"mapviewvc"];
    //
    //    mapviews.array=[aPlaceData objectAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:placeDetail animated:YES];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
}
@end

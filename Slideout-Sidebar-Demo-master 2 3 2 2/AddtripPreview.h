//
//  AddtripPreview.h
//  SidebarDemo
//
//  Created by indianic on 15/08/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

#import "ViewController.h"

@interface AddtripPreview : ViewController
@property (weak, nonatomic) IBOutlet UITextField *editName;
@property (weak, nonatomic) IBOutlet UITextField *editState;
@property (weak, nonatomic) IBOutlet UITextField *editCity;
@property (weak, nonatomic) IBOutlet UITextView *editDescription;

- (IBAction)editMain:(UIBarButtonItem *)sender;
@property (weak, nonatomic) IBOutlet UIImageView *editImage;
- (IBAction)changeImageAct:(UIButton *)sender;
- (IBAction)deleteAct:(UIButton *)sender;
- (IBAction)addTripAct:(UIButton *)sender;



@end

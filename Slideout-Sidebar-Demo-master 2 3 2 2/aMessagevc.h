//
//  aMessagevc.h
//  SidebarDemo
//
//  Created by patel Rahul on 25/07/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface aMessagevc : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIBarButtonItem *aMsgbarbtn;
@property (weak, nonatomic) IBOutlet UITableView *aMessagetableview;

@end

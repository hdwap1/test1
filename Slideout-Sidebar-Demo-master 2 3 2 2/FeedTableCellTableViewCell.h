//
//  FeedTableCellTableViewCell.h
//  SidebarDemo
//
//  Created by indianic on 15/08/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeedTableCellTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *feedPlaceName;

@property (weak, nonatomic) IBOutlet UILabel *feedPlaceCity;

@property (weak, nonatomic) IBOutlet UIImageView *feedPlaceImage;

@property (weak, nonatomic) IBOutlet UILabel *feedPlaceUser;

@end

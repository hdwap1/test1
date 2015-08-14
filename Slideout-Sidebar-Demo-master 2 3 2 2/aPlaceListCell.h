//
//  aPlaceListCell.h
//  SidebarDemo
//
//  Created by indianic on 05/08/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface aPlaceListCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *aPlaceName;
@property (weak, nonatomic) IBOutlet UILabel *aPlaceCity;
@property (weak, nonatomic) IBOutlet UIImageView *aPlaceImage;

@end

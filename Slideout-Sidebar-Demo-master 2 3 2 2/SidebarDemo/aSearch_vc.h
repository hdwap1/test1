//
//  aSearch_vc.h
//  SidebarDemo
//
//  Created by indianic on 03/08/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "aPlaceListCell.h"
#import "aScrollCell.h"
#import <Parse/Parse.h>
@interface aSearch_vc : UIViewController <UIScrollViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UISearchBarDelegate>
{
    NSArray *aPlaceData;
    PFObject *aobject;
    NSArray *allPlaces;
    NSTimer *Timer;
}
//-(void)centerScrollViewContents;
//-(void)scrollViewDoubleTapped:(UITapGestureRecognizer*)recognizer;
//-(void)scrollViewTwoFingerTapped:(UITapGestureRecognizer*)recognizer;
@property (weak, nonatomic) IBOutlet UICollectionView *AcollectionView;

@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) UIPageControl *pageControl;


@property (weak, nonatomic) IBOutlet UIBarButtonItem *aSearchtripbarbtn;

@property (weak, nonatomic) IBOutlet UICollectionView *Acollectionviewslider;
@property (weak,nonatomic) NSString *searchtext;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *aLoadActivity;


@end

//
//  resReservationViewController.h
//  reservation-ios
//
//  Created by Wesley Reisz on 3/31/13.
//  Copyright (c) 2013 com.wesleyreisz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface resReservationViewController : UITableViewController
- (IBAction)reloadButtonPressed:(id)sender;
@property (nonatomic, strong) NSMutableArray *reservations;

@end

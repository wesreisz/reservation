//
//  resAddViewController.h
//  reservation-ios
//
//  Created by Wesley Reisz on 3/31/13.
//  Copyright (c) 2013 com.wesleyreisz. All rights reserved.
//

#import <UIKit/UIKit.h>

@class resReservationViewController;

@interface resAddViewController : UITableViewController
- (IBAction)cancelButtonPressed:(id)sender;
- (IBAction)doneButtonPressed:(id)sender;

@property (nonatomic, strong) IBOutlet UITextField *nameField;
@property (nonatomic, strong) IBOutlet UITextField *cityField;

@property (nonatomic, strong) resReservationViewController *reservationViewController;
@end

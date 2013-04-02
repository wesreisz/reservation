//
//  resEditReservationViewController.h
//  reservation-ios
//
//  Created by Wesley Reisz on 4/1/13.
//  Copyright (c) 2013 com.wesleyreisz. All rights reserved.
//

#import <UIKit/UIKit.h>

@class resReservation;

@interface resEditReservationViewController : UITableViewController

@property (nonatomic, strong) IBOutlet UILabel *reservationIdLabel;
@property (nonatomic, strong) IBOutlet UITextField *reservationNameField;
@property (nonatomic, strong) IBOutlet UITextField *reservationCityField;
@property (nonatomic, strong) resReservation *reservation;

- (IBAction)taskDataChanged:(id)sender;

@end

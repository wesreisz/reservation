//
//  resAddViewController.m
//  reservation-ios
//
//  Created by Wesley Reisz on 3/31/13.
//  Copyright (c) 2013 com.wesleyreisz. All rights reserved.
//

#import "resAddViewController.h"
#import "resReservationViewController.h"
#import "resReservation.h"
#import "resReservationDAO.h"

@interface resAddViewController ()

@end

@implementation resAddViewController

@synthesize nameField = _nameField;
@synthesize reservationViewController  = _reservationViewController;
@synthesize cityField = _cityField;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBActions
- (void) cancelButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:TRUE completion:NULL];
}
- (void) doneButtonPressed:(id)sender{
    resReservation *reservation = [[resReservation alloc] initWithName:self.nameField.text andCity:self.cityField.text];
     NSLog(@"Adding this data: %@", reservation.description);
    //TODO: stopped at 42.10 in http://www.youtube.com/watch?v=2p8Gctq62oU
    //need to figure out how to post a json request to the server.
    //need to delete
    //need to refresh when you go back to list view
    
    resReservationDAO *dao = [[resReservationDAO alloc] init];
    reservation = [dao addReservation:reservation];

    [self dismissViewControllerAnimated:TRUE completion:NULL];
}
@end

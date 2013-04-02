//
//  resEditReservationViewController.m
//  reservation-ios
//
//  Created by Wesley Reisz on 4/1/13.
//  Copyright (c) 2013 com.wesleyreisz. All rights reserved.
//

#import "resEditReservationViewController.h"
#import "resReservation.h"
#import "resReservationDAO.h"

@interface resEditReservationViewController ()

@end

@implementation resEditReservationViewController

bool dataHasChanged = FALSE;

@synthesize reservationIdLabel = _reservationIdLabel;
@synthesize reservationNameField = _reservationNameField;
@synthesize reservationCityField = _reservationCityField;
@synthesize reservation = _reservation;

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
    self.reservationIdLabel.text =  [NSString stringWithFormat:@"%@", self.reservation.reservationId, nil];
    self.reservationNameField.text = self.reservation.name;
    self.reservationCityField.text = self.reservation.city;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:true];
    
    if(dataHasChanged){
        resReservationDAO *dao = [[resReservationDAO alloc] init];
        NSLog(@"%@", self.reservation);
        self.reservation = [dao addReservation:self.reservation];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBActions
-(void)taskDataChanged:(id)sender{
    dataHasChanged = TRUE;
    self.reservation.name = self.reservationNameField.text;
    self.reservation.city = self.reservationCityField.text;
    NSString *val = self.reservationIdLabel.text;
    self.reservation.reservationId = [NSNumber numberWithInt:[val intValue]];
}

@end

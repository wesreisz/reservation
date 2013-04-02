//
//  resReservationViewController.m
//  reservation-ios
//
//  Created by Wesley Reisz on 3/31/13.
//  Copyright (c) 2013 com.wesleyreisz. All rights reserved.
//

#import "resReservationViewController.h"
#import "resReservation.h"
#import "resReservationDAO.h"
#import "resAddReservationControllerViewController.h"
#import "resEditReservationViewController.h"

@interface resReservationViewController ()

@end

@implementation resReservationViewController
@synthesize reservations = _reservations;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:true];

    resReservationDAO *dao = [[resReservationDAO alloc] init];
    _reservations = [dao getAllReservations];
   
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.reservations.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cellReservationTask";
    
    resReservation *currentReservation = [self.reservations objectAtIndex:indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ (%@)",currentReservation.name, currentReservation.city];
    
    return cell;
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        resReservation *aReservation = [self.reservations objectAtIndex:indexPath.row];
        resReservationDAO *dao = [[resReservationDAO alloc] init];
        [dao removeReservation:aReservation];
        
        //reload
        _reservations = [dao getAllReservations];
        [self.tableView reloadData];

    }   
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"EditReservationSegue"]){
        resEditReservationViewController *editReservationController = segue.destinationViewController;
        editReservationController.reservation = [self.reservations objectAtIndex:self.tableView.indexPathForSelectedRow.row];
    }
}
#pragma mark - IBActions
- (void) reloadButtonPressed:(id)sender {
    resReservationDAO *dao = [[resReservationDAO alloc] init];
    _reservations = [dao getAllReservations];
    
    [self.tableView reloadData];
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end

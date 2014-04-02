//
//  resReservationDAO.m
//  reservation-ios
//
//  Created by Wesley Reisz on 3/31/13.
//  Copyright (c) 2013 com.wesleyreisz. All rights reserved.
//

#import "resReservationDAO.h"

@implementation resReservationDAO
NSString *const JSON_URL = @"http://test-reisz.uofl-cis411.com/reservations/api/reservation";

NSMutableArray * _reservations;

-(NSMutableArray *)getAllReservations{
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:JSON_URL]];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSError *error;
    
    //get data
    NSArray *arrReservations = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    _reservations = [[NSMutableArray alloc]init];
    
    for(int i=0;i<[arrReservations count];i++){
        NSDictionary *dicReservation = [arrReservations objectAtIndex:i];
        resReservation *reservation =
            [[resReservation alloc] initWithName:[dicReservation objectForKey:@"ClientName"]
                                         andCity:[dicReservation objectForKey:@"Location"]
                                andReservationId:[dicReservation objectForKey:@"ReservationId"]];
         NSLog(@"%@", [reservation description]);
        [_reservations addObject:reservation];
    }
  
    if(error){
        NSLog(@"%@", error.description);
    }
    
    NSLog(@"Adding data: %i", _reservations.count);
    
    return _reservations;
}
-(resReservation *)addReservation:(resReservation *)reservation{
    NSLog(@"Calling add Reservation with %@", [reservation description]);
    
    reservation = [self addOrUpdateReservation:reservation];
    return reservation;
}
- (resReservation *)updateReservation:(resReservation *) reservation{
    NSLog(@"Calling update Reservation with %@", [reservation description]);
    
    reservation = [self addOrUpdateReservation:reservation];
    return reservation;
}
- (resReservation *)addOrUpdateReservation:(resReservation *) reservation{
    NSLog(@"Calling update Reservation with %@", [reservation description]);
    
    NSString *action = nil;
    NSURL *url2call = nil;
    if(reservation.reservationId==Nil ||reservation.reservationId<=0){
        reservation.reservationId = 0;
        url2call = [NSURL URLWithString:JSON_URL];
        action = @"POST";
    }else{
        NSString *url = [NSString stringWithFormat:@"%@/%@",JSON_URL,reservation.reservationId ];
        url2call = [NSURL URLWithString:url];
        action = @"PUT";
    }
    
    NSString *postBody =
    [NSString stringWithFormat:@"ReservationId=%@&ClientName=%@&Location=%@&X-Requested-With=XMLHttpRequest",
     reservation.reservationId,
     reservation.name,
     reservation.city];
    NSData *postData = [postBody dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:JSON_URL]];
    [request setHTTPMethod:action];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody:postData];
    
    NSError *error = nil;
    [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
    
    if(error){
        NSLog(@"%@", [error description]);
    }
    
    return reservation;
}
-(void)removeReservation:(resReservation *) reservation{
    NSLog(@"Calling remove Reservation with %@", [reservation description]);
    
    NSString *url = [NSString stringWithFormat:@"%@/%@",JSON_URL,reservation.reservationId ];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"DELETE"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    NSError *error = nil;
    [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
    
    if(error){
        NSLog(@"%@", [error description]);
    }
}
@end

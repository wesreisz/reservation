//
//  resReservation.m
//  reservation-ios
//
//  Created by Wesley Reisz on 3/31/13.
//  Copyright (c) 2013 com.wesleyreisz. All rights reserved.
//

#import "resReservation.h"

@implementation resReservation

@synthesize reservationId = _reservationId;
@synthesize name = _name;
@synthesize city = _city;


-(id)initWithName:(NSString *)name andCity:(NSString *)city andReservationId:(NSNumber *)reservationId{
    self = [super init];
    if (self){
        self.name = name;
        self.city = city;
        self.reservationId = reservationId;
    }
    return self;
}

-(id)initWithName:(NSString *)name andCity:(NSString *)city{
    self = [super init];
    if (self){
        self.name = name;
        self.city = city;
    }
    return self;
}
- (NSString *)description{
    return [NSString stringWithFormat:@"Reservation Information: %@ [%@: %@]", self.name, self.reservationId, self.city];
}
@end

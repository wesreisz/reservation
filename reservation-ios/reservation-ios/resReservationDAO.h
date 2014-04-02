//
//  resReservationDAO.h
//  reservation-ios
//
//  Created by Wesley Reisz on 3/31/13.
//  Copyright (c) 2013 com.wesleyreisz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "resReservation.h"

@interface resReservationDAO : NSObject

- (NSMutableArray *) getAllReservations;
- (id)initWithName:(NSString *)name andCity:(NSString *)city andReservationId:(NSInteger *)reservationId;
- (resReservation *)addReservation:(resReservation *) reservation;
- (void)removeReservation:(resReservation *) reservation;
- (resReservation *)updateReservation:(resReservation *) reservation;
@end


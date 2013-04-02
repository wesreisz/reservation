//
//  resReservation.h
//  reservation-ios
//
//  Created by Wesley Reisz on 3/31/13.
//  Copyright (c) 2013 com.wesleyreisz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface resReservation : NSObject
@property (nonatomic, strong) NSNumber *reservationId;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *city;

- (id)initWithName:(NSString *)name andCity:(NSString *)city;
- (id)initWithName:(NSString *)name andCity:(NSString *)city andReservationId:(NSNumber *)reservationId;

@end

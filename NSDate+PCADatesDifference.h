//
//  NSDate+PCADatesDifference.h
//  StudyTime
//
//  Created by Paco Cardenal on 25/2/15.
//  Copyright (c) 2015 Paco Cardenal. All rights reserved.
//

@import Foundation;

@interface NSDate (PCADatesDifference)

+ (NSDate *)calculateDateInTimeZone:(NSDate *)aDate;
+ (NSDate *)calculateDayBeforeToday:(int)numberOfDaysBefore;
+ (NSDate *)calculateYesterday;
+ (NSDate *)calculateToday;
+ (NSDate *)calculateTomorrow;
+ (NSString *)calculateMinutesFromInterval:(NSTimeInterval)anInterval
                              withHourText:(BOOL)hours;
+ (NSInteger)daysBetweenDate:(NSDate*)fromDateTime
                     andDate:(NSDate*)toDateTime;

@end
